output "load_balancer_backend_sets_id" {
  description = "Map of id values across all load_balancer_backend_sets, keyed the same as var.load_balancer_backend_sets except keys with no id are omitted"
  value       = { for k, v in oci_load_balancer_backend_set.load_balancer_backend_sets : k => v.id if v.id != null && length(v.id) > 0 }
}
output "load_balancer_backend_sets_backend" {
  description = "Map of backend values across all load_balancer_backend_sets, keyed the same as var.load_balancer_backend_sets except keys with no backend are omitted"
  value       = { for k, v in oci_load_balancer_backend_set.load_balancer_backend_sets : k => v.backend if v.backend != null && length(v.backend) > 0 }
}
output "load_balancer_backend_sets_backend_max_connections" {
  description = "Map of backend_max_connections values across all load_balancer_backend_sets, keyed the same as var.load_balancer_backend_sets except keys with no backend_max_connections are omitted"
  value       = { for k, v in oci_load_balancer_backend_set.load_balancer_backend_sets : k => v.backend_max_connections if v.backend_max_connections != null }
}
output "load_balancer_backend_sets_health_checker" {
  description = "Map of health_checker values across all load_balancer_backend_sets, keyed the same as var.load_balancer_backend_sets except keys with no health_checker are omitted"
  value       = { for k, v in oci_load_balancer_backend_set.load_balancer_backend_sets : k => one(v.health_checker) if v.health_checker != null && length(v.health_checker) > 0 }
}
output "load_balancer_backend_sets_lb_cookie_session_persistence_configuration" {
  description = "Map of lb_cookie_session_persistence_configuration values across all load_balancer_backend_sets, keyed the same as var.load_balancer_backend_sets except keys with no lb_cookie_session_persistence_configuration are omitted"
  value       = { for k, v in oci_load_balancer_backend_set.load_balancer_backend_sets : k => one(v.lb_cookie_session_persistence_configuration) if v.lb_cookie_session_persistence_configuration != null && length(v.lb_cookie_session_persistence_configuration) > 0 }
}
output "load_balancer_backend_sets_load_balancer_id" {
  description = "Map of load_balancer_id values across all load_balancer_backend_sets, keyed the same as var.load_balancer_backend_sets except keys with no load_balancer_id are omitted"
  value       = { for k, v in oci_load_balancer_backend_set.load_balancer_backend_sets : k => v.load_balancer_id if v.load_balancer_id != null && length(v.load_balancer_id) > 0 }
}
output "load_balancer_backend_sets_name" {
  description = "Map of name values across all load_balancer_backend_sets, keyed the same as var.load_balancer_backend_sets except keys with no name are omitted"
  value       = { for k, v in oci_load_balancer_backend_set.load_balancer_backend_sets : k => v.name if v.name != null && length(v.name) > 0 }
}
output "load_balancer_backend_sets_policy" {
  description = "Map of policy values across all load_balancer_backend_sets, keyed the same as var.load_balancer_backend_sets except keys with no policy are omitted"
  value       = { for k, v in oci_load_balancer_backend_set.load_balancer_backend_sets : k => v.policy if v.policy != null && length(v.policy) > 0 }
}
output "load_balancer_backend_sets_session_persistence_configuration" {
  description = "Map of session_persistence_configuration values across all load_balancer_backend_sets, keyed the same as var.load_balancer_backend_sets except keys with no session_persistence_configuration are omitted"
  value       = { for k, v in oci_load_balancer_backend_set.load_balancer_backend_sets : k => one(v.session_persistence_configuration) if v.session_persistence_configuration != null && length(v.session_persistence_configuration) > 0 }
}
output "load_balancer_backend_sets_ssl_configuration" {
  description = "Map of ssl_configuration values across all load_balancer_backend_sets, keyed the same as var.load_balancer_backend_sets except keys with no ssl_configuration are omitted"
  value       = { for k, v in oci_load_balancer_backend_set.load_balancer_backend_sets : k => one(v.ssl_configuration) if v.ssl_configuration != null && length(v.ssl_configuration) > 0 }
}
output "load_balancer_backend_sets_state" {
  description = "Map of state values across all load_balancer_backend_sets, keyed the same as var.load_balancer_backend_sets except keys with no state are omitted"
  value       = { for k, v in oci_load_balancer_backend_set.load_balancer_backend_sets : k => v.state if v.state != null && length(v.state) > 0 }
}

