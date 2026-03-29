resource "kubernetes_deployment" "inflate" {
  metadata {
    name = "inflate"
  }

  spec {
    replicas = 2
    selector {
      match_labels = { app = "inflate" }
    }
    template {
      metadata {
        labels = { app = "inflate" }
      }
      spec {
        termination_grace_period_seconds = 0
        node_selector = {
          eks.amazonaws.com/compute-type = "auto"
        }
        security_context {
          run_as_user     = 1000
          run_as_group = 3000
          fs_group = 2000
        }
        container {
          image = "public.ecr.aws/eks-distro/kubernetes/pause:3.7"
          name  = "inflate"
          resources {
            requests = { cpu = "1" }
          }
          security_context {
            allow_privilege_escalation = false
          }
        }
      }
    }
  }
}
