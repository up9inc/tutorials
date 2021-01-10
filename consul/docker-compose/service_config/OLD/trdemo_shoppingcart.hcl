service {
  name = "trdemo_shoppingcart"
  id = "trdemo_shoppingcart_v1"
  address = "10.10.0.13"
  port = 5300
  
  connect { 
    sidecar_service {
      port = 20000
      
      check {
        name = "Connect Envoy Sidecar"
        tcp = "10.10.0.13:20000"
        interval ="10s"
      }

      proxy {
        config {
          envoy_public_listener_json = <<EOL
           {
           "@type": "type.googleapis.com/envoy.api.v2.Listener",
           "name": "public_listener:10.10.0.13:20000",
           "address": { "socket_address": { "address": "10.10.0.13", "port_value": 20000 } },
           "filter_chains": [
            {
             "tls_context": { },
             "filters": [
              {
               "name": "envoy.http_connection_manager",
               "config": {
                "route_config": {
                 "name": "public_listener",
                 "virtual_hosts": [
                  {
                   "routes": [ { "route": { "cluster": "local_app" }, "match": { "prefix": "/" } } ],
                   "domains": [ "*" ],
                   "name": "public_listener"
                  }
                 ]
                },
                "tracing": { "random_sampling": {} },
                "http_filters": [
                 { "name": "envoy.filters.http.tap",
                   "config": { "common_config": { "admin_config": { "config_id": "alex_id" } } }
                 },
                 { "name": "envoy.router" }
                ],
                "stat_prefix": "public_listener"
               }
              }
             ]
            }
           ]
          }
       EOL
     }  
    }
   }
  }
}
