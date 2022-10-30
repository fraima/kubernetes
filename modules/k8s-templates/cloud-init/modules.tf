
module "kube-apiserver-kubeconfig" {
    source = "../kubeconfig"
      component-name        = "kube-apiserver"
      certificate-authority = local.kube-apiserver-kubeconfig-certificate-authority
      client-certificate    = local.kube-apiserver-kubeconfig-client-certificate
      client-key            = local.kube-apiserver-kubeconfig-client-key
}

module "kubelet-kubeconfig" {
    source = "../kubeconfig"
      component-name        = "kubelet"
      certificate-authority = local.kubelet-kubeconfig-certificate-authority
      client-certificate    = local.kubelet-kubeconfig-client-certificate
      client-key            = local.kubelet-kubeconfig-client-key
}

module "kube-scheduler-kubeconfig" {
    source = "../kubeconfig"
      component-name        = "kube-scheduler"
      certificate-authority = local.kube-scheduler-kubeconfig-certificate-authority
      client-certificate    = local.kube-scheduler-kubeconfig-client-certificate
      client-key            = local.kube-scheduler-kubeconfig-client-key
}

module "kube-controller-manager-kubeconfig" {
    source = "../kubeconfig"
      component-name        = "kube-controller-manager"
      certificate-authority = local.kube-controller-manager-kubeconfig-certificate-authority
      client-certificate    = local.kube-controller-manager-kubeconfig-client-certificate
      client-key            = local.kube-controller-manager-kubeconfig-client-key
}

module "containerd-service" {
    source = "../services/containerd"
}

module "sysctl" {
    source = "../sysctl"
}

module "modprobe" {
    source = "../modprobe"
}

module "cni" {
    source = "../cni"
}

module "k8s-kube-apiserver" {
    source = "../k8s/kube-apiserver"
}

module "bashrc" {
    source = "../bashrc"
    k8s_global_vars = var.k8s_global_vars

}

module "kubelet-service" {
    source = "../services/kubelet"
    instance_type = "master"
    k8s_global_vars = var.k8s_global_vars
}

module "key-keeper-service" {
    source = "../services/key-keeper"
    instance_type = "master"
    k8s_global_vars = var.k8s_global_vars

}

module "static-pod-etcd" {
    source = "../static-pods/etcd"
    instance_type = "master"
    k8s_global_vars = var.k8s_global_vars
    etcd_image    = local.release-vars["v0_1"].etcd.registry
    etcd_version  = local.release-vars["v0_1"].etcd.version
}

module "static-pod-kube-apiserver" {
    source = "../static-pods/kube-apiserver"
    instance_type = "master"
    k8s_global_vars = var.k8s_global_vars
    kube_apiserver_image          = local.release-vars["v0_1"].kube-apiserver.registry
    kube_apiserver_image_version  = local.release-vars["v0_1"].kube-apiserver.version
    oidc_issuer_url = "https://auth.dobry-kot.ru/auth"
    oidc_client_id  = "kubernetes-master"
}

module "static-pod-kube-controller-manager" {
    source = "../static-pods/kube-controller-manager"
    instance_type = "master"
    k8s_global_vars = var.k8s_global_vars
    kube_controller_manager_image    = local.release-vars["v0_1"].kube-controller-manager.registry
    kube_controller_manager_version  = local.release-vars["v0_1"].kube-controller-manager.version

}

module "static-pod-kube-scheduler" {
    source = "../static-pods/kube-scheduler"
    instance_type = "master"
    k8s_global_vars = var.k8s_global_vars
    kube_scheduler_image    = local.release-vars["v0_1"].kube-scheduler.registry
    kube_scheduler_version  = local.release-vars["v0_1"].kube-scheduler.version

}