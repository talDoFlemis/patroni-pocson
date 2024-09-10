resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

variable "grafana_admin_password" {
  type     = string
  nullable = false
}

resource "kubernetes_secret" "grafana_admin_creds" {
  metadata {
    name      = "grafana-admin-creds"
    namespace = kubernetes_namespace.monitoring.metadata[0].name
  }

  data = {
    username = "admin"
    password = var.grafana_admin_password
  }
}

resource "helm_release" "kube_prometheus_stack" {
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = kubernetes_namespace.monitoring.metadata[0].name

  values = [
    file("kube-prometheus-values.yaml")
  ]

  # Grafana configs
  set {
    name  = "grafana.admin.existingSecret"
    value = kubernetes_secret.grafana_admin_creds.metadata[0].name
  }
}
