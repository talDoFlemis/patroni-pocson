resource "helm_release" "sensei" {
  depends_on = [helm_release.kube_prometheus_stack]
  name       = "sensei"
  chart      = "../sensei/"
}
