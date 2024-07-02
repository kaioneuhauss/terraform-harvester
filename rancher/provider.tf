terraform {
  required_version = ">= 0.13"
  required_providers {
    harvester = {
      source  = "harvester/harvester"
      version = "0.6.4"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
    ssh = {
      source  = "loafoe/ssh"
      version = "2.7.0"
    }
  }
  backend "kubernetes" {
    secret_suffix    = "state-rke2"
    config_path      = "/root/.kube/harvester.yaml"
  }
}

provider "harvester" {
}
provider "helm" {
  kubernetes {
    config_path = "kube_config.yaml"
  }
}

#terraform {
#  required_version = ">= 0.13"
#  required_providers {
#    harvester = {
#      source  = "harvester/harvester"
#      version = "0.6.4"
#    }
#    local = {
#      source  = "hashicorp/local"
#      version = "2.2.3"
#    }
#    tls = {
#      source  = "hashicorp/tls"
#      version = "3.4.0"
#    }
#    ssh = {
#      source  = "loafoe/ssh"
#      version = "1.2.0"
#    }
#  }
#provider "harvester" {
#  kubeconfig = var.harvester_kubeconfig_path
#}

