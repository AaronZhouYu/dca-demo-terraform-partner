[global.v1]
  [global.v1.session_settings]
    enable_idle_timeout = true
    idle_timeout_minutes = 600
[event_gateway]
  [event_gateway.v1]
    [event_gateway.v1.sys]
      [event_gateway.v1.sys.service]
        disable_frontend_tls = ${disable_event_tls}
