

variable "instance_type" {
  description = "K8S: node type"
  type        = string
  default     = null
}

variable "k8s_global_vars" {
  description = "module:K8S-CERTIFICATE-VARS: base certificate vars"
  type        = any
  default     = {}
}

variable "master_instance_count" {
  description = "K8S: masters number"
  type = number
  default = 0
}

variable "worker_instance_count" {
  description = "K8S: workers number"
  type = number
  default = 0
}
