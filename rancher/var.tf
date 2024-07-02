#VARIÁVEIS PRIMEIRO NÓ Rancher1 SO

variable "harvester_kubeconfig_path" {
  description = "Harvester cluster Kubeconfig file name with full path"
  type        = string
  default = "/root/.kube/harvester.yaml"
}

variable "name_1" {
  type= string
  default= "rancher1"
}

variable "name_2" {
  type= string
  default= "rancher2"
}

variable "name_3" {
  type= string
  default= "rancher3"
}

variable "namespace_1" {
  type= string
  default= "rancher"
}

variable "description_1" {
  type= string
  default= "VM Inicial"
}

variable "hostname_1" {
  type= string
  default= "rancher1"
}

variable "hostname_2" {
  type= string
  default= "rancher2"
}

variable "hostname_3" {
  type= string
  default= "rancher3"
}


variable "tags_1" {
  type= map(string)
  default= {"ssh-user"="kaio"}
}

variable "cpus_1" {
  type= number
  default= "4"
}

variable "memory_1" {
  type= string
  default= "8Gi"
}

variable "disk_name_1" {
  type= string
  default= "iso"
}

variable "disk_size_1" {
  type= string
  default= "60Gi"
}

variable "disk_boot_order_1"{
  type= number
  default= "1"
}

variable "disk_name_2" {
  type= string
  default= "root"
}

variable "disk_size_2" {
  type= string
  default= "60Gi"
}

variable "disk_boot_order_2"{
  type= number
  default= "2"
}

#INSTALAÇÃO RANCHER

variable "cluster_token"{
  type= string
  default= "rancher"
}

variable "cp_hostname"{
  type = string
  default= "rancher1.neuhauss.com.br"
}

variable "cp_hostname2"{
  type = string
  default= "rancher2.neuhauss.com.br"
}

variable "cp_hostname3"{
  type = string
  default= "rancher3.neuhauss.com.br"
}


variable "master_vip"{
  type= string
  default= "192.168.20.102"
}

variable "gateway"{
  type= string
  default= "192.168.20.1"
}

variable "nameserver"{
  type= string
  default= "192.168.1.10"
}

#IP DO NO 1
variable "ip_1"{
  type= string
  default= "192.168.20.100"
}

#IP DO NO 2
variable "ip_2"{
  type= string
  default= "192.168.20.101"
}

#IP DO NO 2
variable "ip_3"{
  type= string
  default= "192.168.20.101"
}

variable "master_vip_interface" {
    type = string
    default = "eth0"
}

variable "kubeconfig_filename" {
    type = string
    default = "kube_config.yaml"
}

variable "cert_manager_version" {
    type = string
    default = "1.8.1"
}

variable "rancher_version" {
    type = string
    default = "2.8.4"
}

variable "rancher_bootstrap_password" {
    type = string
    default = "admin"
}

variable "rancher_server_dns" {
    type = string
    default = "rancher-hrv.neuhauss.com.br"
}


