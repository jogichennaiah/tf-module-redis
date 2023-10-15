# Reads the information from the remote statefile

data "terraform_remote_state" "vpc" {
    backend = "s3"
    config = {
        bucket  = "b55-terraform-bucket"
        key     = "vpc/${var.ENV}/terraform.tfstate"
        region  = "us-east-1" 
    }
}