data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "sftp_server" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  key_name      = var.key_name

  security_groups      = [aws_security_group.sftp_sg.name]
  iam_instance_profile = aws_iam_instance_profile.ec2_sftp_profile.name

  user_data = <<-EOF
              #cloud-config
              fs_setup:
                - label: sftp_storage
                  filesystem: 'xfs'
                  device: '/dev/sdh'
                  partition: auto
                  overwrite: false

              mounts:
                - [ "/dev/disk/by-label/sftp_storage", "/home/${var.instance_username}/upload" ]

              packages:
                - openssh-server
                - openssh-clients

              runcmd:
                - systemctl enable sshd
                - systemctl start sshd
                - useradd ${var.instance_username}
                - echo ${var.instance_username}:${var.instance_password} | chpasswd
                - mkdir -p /home/${var.instance_username}/upload
                - chown ${var.instance_username}:${var.instance_username} /home/${var.instance_username}/upload
              EOF
}
