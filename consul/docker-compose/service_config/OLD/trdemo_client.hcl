service {
  name = "trdemo_client"
  id = "trdemo_client_v1"
  address = "10.10.0.10"
  port = 5000
  
  connect { 
    sidecar_service {
      port = 20000
      
      check {
        name = "Connect Envoy Sidecar"
        tcp = "10.10.0.10:20000"
        interval ="10s"
      }

      proxy {
        upstreams = [
          {
            destination_name = "trdemo_flights"
            local_bind_address = "127.0.0.1"
            local_bind_port = 15100
          },
          {
            destination_name = "trdemo_users"
            local_bind_address = "127.0.0.1"
            local_bind_port = 15200
          },
          {
            destination_name = "trdemo_shoppingcart"
            local_bind_address = "127.0.0.1"
            local_bind_port = 15300
          }
        ]
      }
    }  
  }
}

#
#service {
#  name = "web"
#  id = "web-v1"
#  address = "10.5.0.4"
#  port = 9090
#  
#  connect { 
#    sidecar_service {
#      port = 20000
#      
#      check {
#        name = "Connect Envoy Sidecar"
#        tcp = "10.5.0.4:20000"
#        interval ="10s"
#      }
#
#      proxy {
#        upstreams {
#          destination_name = "api"
#          local_bind_address = "127.0.0.1"
#          local_bind_port = 9091
#        }
#      }
#    }  
#  }
#}
