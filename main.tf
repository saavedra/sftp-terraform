provider "aws" {
  region = "us-east-1"
}

output "instance_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.sftp_server.public_ip
}
