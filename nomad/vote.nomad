job "vote-nomad" {
  datacenters = ["dc1"]
  type = "service"
  group "vote-group" {
    task "vote" {
      driver = "docker"
      config {
        image = "sakibj/vote_vote:cs553"
        dns_search_domains = ["service.dc1.consul"]
        dns_servers = ["172.17.0.1", "8.8.8.8"]
        port_map {
          http = 80
        }
      }
      service {
        name = "vote"
        port = "http"
        check {
          name = "vote interface running on port 80"
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
            static = 5000
          }
        }
      }
    }
  }
}
