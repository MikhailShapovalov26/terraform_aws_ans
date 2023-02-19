terraform {
  backend "s3" {
    bucket  = "bucket-r-save"
    encrypt = true
    key     = "terraform.tfstate"
    region  = "eu-west-3"
  }
}