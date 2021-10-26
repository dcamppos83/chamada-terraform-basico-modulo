provider "aws" {
    region = "us-east-1"
    version = "~> 3.0"
}

terraform {
    backend "s3" {
        bucket = "descomplicando-terraform-danielcampos-tfstate"
        #dynamodb_table = "terraform-state-lock-dynamo"
        key = "terraform.tfstate"
        region = "us-east-1"
    }
}

module "produto" {
  source  =  "git@github.com:dcamppos83/terraform-basico-modulo.git?ref=v1.0.0"
  environment = "production"
}

output "ip_address" {
  value = module.produto.ip_address
}