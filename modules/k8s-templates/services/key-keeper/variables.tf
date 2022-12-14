

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

variable "instance_list_map" {
  description = "K8S: node type"
  type        = any
  default     = {}
}
