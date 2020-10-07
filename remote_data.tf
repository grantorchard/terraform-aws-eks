data terraform_remote_state "terraform-aws-core" {
  backend = "remote"

  config = {
    organization = "grantorchard"
    workspaces = {
      name = "terraform-aws-core"
    }
  }
}