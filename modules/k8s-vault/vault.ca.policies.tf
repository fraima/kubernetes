resource "vault_policy" "kubernetes-ca-approle" {
  for_each  = local.intermediate_content_map
  
  name      = "clusters/${var.cluster_name}/ca/${split(":","${each.key}")[0]}"

  policy = templatefile("../../modules/k8s-vault/templates/vault/vault-intermediate-read-role.tftpl", { 
    pki_path              = var.k8s_certificate_vars.ssl.intermediate[split(":","${each.key}")[0]].path
    cluster_name          = var.cluster_name
    ca_name               = split(":","${each.key}")[0]
    master_instance_list  = var.master_instance_list
    }
  )
}

resource "vault_policy" "external-ca-approle" {
  for_each  = local.external_intermediate_content_map
  
  name      = "clusters/${var.cluster_name}/external-ca/${split(":","${each.key}")[0]}"

  policy = templatefile("../../modules/k8s-vault/templates/vault/vault-intermediate-read-role.tftpl", { 
    pki_path              = var.k8s_certificate_vars.ssl.external_intermediate[split(":","${each.key}")[0]].path
    cluster_name          = var.cluster_name
    ca_name               = split(":","${each.key}")[0]
    master_instance_list  = var.master_instance_list
    }
  )
}
