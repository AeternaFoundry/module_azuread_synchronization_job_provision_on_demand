variable "synchronization_job_provision_on_demands" {
  description = <<EOT
Map of synchronization_job_provision_on_demands, attributes below
Required:
    - service_principal_id
    - synchronization_job_id
    - parameter (block):
        - rule_id (required)
        - subject (required, block):
            - object_id (required)
            - object_type_name (required)
Optional:
    - triggers
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
EOT

  type = map(object({
    service_principal_id   = string
    synchronization_job_id = string
    triggers               = optional(map(string))
    parameter = list(object({
      rule_id = string
      subject = list(object({
        object_id        = string
        object_type_name = string
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.synchronization_job_provision_on_demands : (
        length(v.parameter) >= 1
      )
    ])
    error_message = "Each parameter list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.synchronization_job_provision_on_demands : (
        alltrue([for item in v.parameter : (length(item.subject) >= 1)])
      )
    ])
    error_message = "Each subject list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.synchronization_job_provision_on_demands : (
        can(regex("^(/[^/]+/[^/]+)+$", v.service_principal_id))
      )
    ])
    error_message = "must be a valid Azure resource ID"
  }
  validation {
    condition = alltrue([
      for k, v in var.synchronization_job_provision_on_demands : (
        can(regex("^(/[^/]+/[^/]+)+$", v.synchronization_job_id))
      )
    ])
    error_message = "must be a valid Azure resource ID"
  }
  validation {
    condition = alltrue([
      for k, v in var.synchronization_job_provision_on_demands : (
        alltrue([for item in v.parameter : (alltrue([for item in item.subject : (contains(["Group", "user", "User", "Worker"], item.object_type_name))]))])
      )
    ])
    error_message = "must be one of: \"Group\", \"user\", \"User\", \"Worker\""
  }
}

