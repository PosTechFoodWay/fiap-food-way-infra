resource "kubernetes_namespace" "foodway" {
  metadata {
    name = "foodway"
  }
}

resource "kubernetes_deployment" "foodway_api" {
  metadata {
    name      = "foodway-api"
    namespace = kubernetes_namespace.foodway.metadata[0].name
    labels = {
      app = "foodway-api"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "foodway-api"
      }
    }

    template {
      metadata {
        labels = {
          app = "foodway-api"
        }
      }

      spec {
        container {
          name  = "foodway-api"
          image = "${aws_ecr_repository.foodway_api.repository_url}:${var.image_tag}"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}
