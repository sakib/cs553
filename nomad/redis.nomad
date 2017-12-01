job "redis-nomad" {
  datacenters = ["dc1"]
  type = "service"
  group "redis-group" {
    task "redis" {
      driver = "docker"
      config {
        image = "redis:3.2"
        port_map {
          db = 6379
        }
      }
      resources {
        cpu    = 250
        memory = 128
        network {
          mbits = 10
          port "db" {}
        }
      }
      service {
        name = "redis"
        address_mode = "driver"
        port = "db"
        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
