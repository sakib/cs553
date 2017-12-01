job "result-nomad" {
  datacenters = ["dc1"]
  type = "service"
  group "result-group" {
    task "result" {
      driver = "docker"
      config {
        image = "sakibj/vote_result:cs553"
        dns_search_domains = ["service.dc1.consul"]
        dns_servers = ["172.17.0.1", "8.8.8.8"]
        port_map {
          http = 80
        }
      }
      service {
        name = "result"
        port = "http"
        check {
          name = "result interface running on port 80"
          interval = "10s"
          timeout = "5s"
          type = "http"
          protocol = "http"
          path = "/"
        }
      }
      resources {
        cpu = 250
        memory = 128
        network {
          port "http" {
            static = 5001
          }
        }
      }
    }
  }
}
