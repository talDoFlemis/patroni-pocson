# Define the Deployment
resource "kubernetes_deployment" "nocodb" {
  metadata {
    name = "nocodb"
    labels = {
      app = "nocodb"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "nocodb"
      }
    }

    template {
      metadata {
        labels = {
          app = "nocodb"
        }
      }

      spec {
        container {
          name  = "nocodb"
          image = "nocodb/nocodb:latest"

          port {
            container_port = 8080
          }

          env {
            name  = "NC_DB"
            value = "pg://sensei-primary:5432?u=postgres&p=postgres&d=postgres"
          }

          volume_mount {
            name       = "nc-data"
            mount_path = "/usr/app/data"
          }
        }

        volume {
          name = "nc-data"

          empty_dir {}
        }
      }
    }
  }
}

# Define the Service
resource "kubernetes_service" "nocodb_service" {
  metadata {
    name = "nocodb-service"
  }

  spec {
    selector = {
      app = "nocodb"
    }

    port {
      protocol    = "TCP"
      port        = 8080
      target_port = 8080
    }

    type = "ClusterIP" # Change to "LoadBalancer" for external access
  }
}
