variable "load_balancer_backend_sets" {
  description = <<EOT
Map of load_balancer_backend_sets, attributes below
Required:
    - load_balancer_id
    - name
    - policy
    - health_checker (block):
        - interval_ms (optional)
        - is_force_plain_text (optional)
        - port (optional)
        - protocol (required)
        - response_body_regex (optional)
        - retries (optional)
        - return_code (optional)
        - timeout_in_millis (optional)
        - url_path (optional)
Optional:
    - backend_max_connections
    - lb_cookie_session_persistence_configuration (block):
        - cookie_name (optional)
        - disable_fallback (optional)
        - domain (optional)
        - is_http_only (optional)
        - is_secure (optional)
        - max_age_in_seconds (optional)
        - path (optional)
    - session_persistence_configuration (block):
        - cookie_name (required)
        - disable_fallback (optional)
    - ssl_configuration (block):
        - certificate_ids (optional)
        - certificate_name (optional)
        - cipher_suite_name (optional)
        - protocols (optional)
        - server_order_preference (optional)
        - trusted_certificate_authority_ids (optional)
        - verify_depth (optional)
        - verify_peer_certificate (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    load_balancer_id        = string
    name                    = string
    policy                  = string
    backend_max_connections = optional(number)
    health_checker = object({
      interval_ms         = optional(number)
      is_force_plain_text = optional(bool)
      port                = optional(number)
      protocol            = string
      response_body_regex = optional(string)
      retries             = optional(number)
      return_code         = optional(number)
      timeout_in_millis   = optional(number)
      url_path            = optional(string)
    })
    lb_cookie_session_persistence_configuration = optional(object({
      cookie_name        = optional(string)
      disable_fallback   = optional(bool)
      domain             = optional(string)
      is_http_only       = optional(bool)
      is_secure          = optional(bool)
      max_age_in_seconds = optional(number)
      path               = optional(string)
    }))
    session_persistence_configuration = optional(object({
      cookie_name      = string
      disable_fallback = optional(bool)
    }))
    ssl_configuration = optional(object({
      certificate_ids                   = optional(list(string))
      certificate_name                  = optional(string)
      cipher_suite_name                 = optional(string)
      protocols                         = optional(list(string))
      server_order_preference           = optional(string)
      trusted_certificate_authority_ids = optional(list(string))
      verify_depth                      = optional(number)
      verify_peer_certificate           = optional(bool)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.load_balancer_backend_sets : (
        v.lb_cookie_session_persistence_configuration == null || (v.lb_cookie_session_persistence_configuration.max_age_in_seconds == null || (v.lb_cookie_session_persistence_configuration.max_age_in_seconds >= 1))
      )
    ])
    error_message = "must be at least 1"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

