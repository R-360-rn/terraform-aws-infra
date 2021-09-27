variable "AWS_CREDS_FILE_PATH" {
  type        = string
  default     = "../credentials"
  description = "The id of the machine image (AMI) to use for the server."
}

variable "azs" {
  type        = list
  default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  description = "description"
}
