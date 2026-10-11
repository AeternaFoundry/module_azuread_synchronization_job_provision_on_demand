output "synchronization_job_provision_on_demands_id" {
  description = "Map of id values across all synchronization_job_provision_on_demands, keyed the same as var.synchronization_job_provision_on_demands"
  value       = { for k, v in azuread_synchronization_job_provision_on_demand.synchronization_job_provision_on_demands : k => v.id if v.id != null && length(v.id) > 0 }
}
output "synchronization_job_provision_on_demands_parameter" {
  description = "Map of parameter values across all synchronization_job_provision_on_demands, keyed the same as var.synchronization_job_provision_on_demands"
  value       = { for k, v in azuread_synchronization_job_provision_on_demand.synchronization_job_provision_on_demands : k => v.parameter if v.parameter != null && length(v.parameter) > 0 }
}
output "synchronization_job_provision_on_demands_service_principal_id" {
  description = "Map of service_principal_id values across all synchronization_job_provision_on_demands, keyed the same as var.synchronization_job_provision_on_demands"
  value       = { for k, v in azuread_synchronization_job_provision_on_demand.synchronization_job_provision_on_demands : k => v.service_principal_id if v.service_principal_id != null && length(v.service_principal_id) > 0 }
}
output "synchronization_job_provision_on_demands_synchronization_job_id" {
  description = "Map of synchronization_job_id values across all synchronization_job_provision_on_demands, keyed the same as var.synchronization_job_provision_on_demands"
  value       = { for k, v in azuread_synchronization_job_provision_on_demand.synchronization_job_provision_on_demands : k => v.synchronization_job_id if v.synchronization_job_id != null && length(v.synchronization_job_id) > 0 }
}
output "synchronization_job_provision_on_demands_triggers" {
  description = "Map of triggers values across all synchronization_job_provision_on_demands, keyed the same as var.synchronization_job_provision_on_demands"
  value       = { for k, v in azuread_synchronization_job_provision_on_demand.synchronization_job_provision_on_demands : k => v.triggers if v.triggers != null && length(v.triggers) > 0 }
}

