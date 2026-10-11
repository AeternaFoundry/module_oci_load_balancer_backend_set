resource "oci_load_balancer_backend_set" "load_balancer_backend_sets" {
  for_each = var.load_balancer_backend_sets

  load_balancer_id        = each.value.load_balancer_id
  name                    = each.value.name
  policy                  = each.value.policy
  backend_max_connections = each.value.backend_max_connections

  health_checker {
    interval_ms         = each.value.health_checker.interval_ms
    is_force_plain_text = each.value.health_checker.is_force_plain_text
    port                = each.value.health_checker.port
    protocol            = each.value.health_checker.protocol
    response_body_regex = each.value.health_checker.response_body_regex
    retries             = each.value.health_checker.retries
    return_code         = each.value.health_checker.return_code
    timeout_in_millis   = each.value.health_checker.timeout_in_millis
    url_path            = each.value.health_checker.url_path
  }

  dynamic "lb_cookie_session_persistence_configuration" {
    for_each = each.value.lb_cookie_session_persistence_configuration != null ? [each.value.lb_cookie_session_persistence_configuration] : []
    content {
      cookie_name        = lb_cookie_session_persistence_configuration.value.cookie_name
      disable_fallback   = lb_cookie_session_persistence_configuration.value.disable_fallback
      domain             = lb_cookie_session_persistence_configuration.value.domain
      is_http_only       = lb_cookie_session_persistence_configuration.value.is_http_only
      is_secure          = lb_cookie_session_persistence_configuration.value.is_secure
      max_age_in_seconds = lb_cookie_session_persistence_configuration.value.max_age_in_seconds
      path               = lb_cookie_session_persistence_configuration.value.path
    }
  }

  dynamic "session_persistence_configuration" {
    for_each = each.value.session_persistence_configuration != null ? [each.value.session_persistence_configuration] : []
    content {
      cookie_name      = session_persistence_configuration.value.cookie_name
      disable_fallback = session_persistence_configuration.value.disable_fallback
    }
  }

  dynamic "ssl_configuration" {
    for_each = each.value.ssl_configuration != null ? [each.value.ssl_configuration] : []
    content {
      certificate_ids                   = ssl_configuration.value.certificate_ids
      certificate_name                  = ssl_configuration.value.certificate_name
      cipher_suite_name                 = ssl_configuration.value.cipher_suite_name
      protocols                         = ssl_configuration.value.protocols
      server_order_preference           = ssl_configuration.value.server_order_preference
      trusted_certificate_authority_ids = ssl_configuration.value.trusted_certificate_authority_ids
      verify_depth                      = ssl_configuration.value.verify_depth
      verify_peer_certificate           = ssl_configuration.value.verify_peer_certificate
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

