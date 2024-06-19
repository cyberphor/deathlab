packer {
  required_plugins {
    vmware = {
      source = "github.com/hashicorp/vmware"
      version = "~> 1"
    }
    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = "~> 1"
    }
  }
}