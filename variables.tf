variable "instance_username" {
  description = "Username for the SFTP user"
  type        = string
}

variable "instance_password" {
  description = "Password for the SFTP user"
  type        = string
  sensitive   = true
}

variable "volume_size" {
  description = "Size of the EBS volume in GB"
  type        = number
  default     = 36
}

variable "key_name" {
  description = "Key pair name for the EC2 instance"
  type        = string
}
