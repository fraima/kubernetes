resource "helm_release" "coredns" {
  depends_on = [helm_release.cilium]
  name       = "coredns"
  repository = "https://coredns.github.io/helm"
  chart      = "coredns"
  version    = "1.19.4"
  namespace  = "fraima-dns"
  create_namespace  = true

  values = [
    file("${path.module}/templates/helm/coredns/values.yaml")
  ]
}