terraform {
  required_providers {
    mist = {
      source  = "registry.terraform.io/Juniper/mist"
      version = "0.4.8"
    }
  }
}

provider "mist" {
  host = var.mist_cloud
  #apitoken = "" # Not used here. MIST_API_TOKEN environment variable is used instead.
}