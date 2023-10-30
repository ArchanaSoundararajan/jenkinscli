
terraform {
  cloud {
    hostname = "ck-tfe.sandpedia.com"
    organization = "cloud-kinetics-admin"

    workspaces {
      name = "tfe-jenkins-cli"
    }
  }
}
resource "random_string" "random" {
  length           = 8
  special          = true
  override_special = "/@£$"
}

output "result" {
value = random_string.random.result
}
  
