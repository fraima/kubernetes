output "kube-apiserver-lb" {
  value = tolist(tolist(yandex_lb_network_load_balancer.api-external.listener)[0].external_address_spec)[0].address
}

output "master_sa_policy" {
  value = local.iam_admin_members
}
