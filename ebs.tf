resource "aws_ebs_volume" "sftp_storage" {
  availability_zone = aws_instance.sftp_server.availability_zone
  size              = var.volume_size
  tags = {
    Name = "sftp_storage"
  }
}

resource "aws_volume_attachment" "sftp_storage_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.sftp_storage.id
  instance_id = aws_instance.sftp_server.id
}
