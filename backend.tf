terraform {
    backend "s3" {
        region = "us-east-1"
        bucket = "backend-terraform"
        encrypt = "true"
        key = "terraform.tfstate"
    }
}