resource "aws_instance" "ec2_instances" {
  ami                         = var.ec2_instance_ami
  instance_type               = var.ec2_instance_type
  availability_zone           = var.ec2_instance_availability_zone
  subnet_id                   = var.ec2_instance_subnet_id
  vpc_security_group_ids      = var.ec2_instance_vpc_security_group_ids
  key_name                    = var.ec2_instance_key_name
  associate_public_ip_address = var.ec2_instance_associate_public_ip_address

  dynamic "root_block_device" {
    for_each = var.ec2_isntance_root_block_device != null ? [1] : []

    content {
      delete_on_termination = var.ec2_isntance_root_block_device.delete_on_termination
      encrypted             = var.ec2_isntance_root_block_device.encrypted
      volume_size           = var.ec2_isntance_root_block_device.volume_size
      volume_type           = var.ec2_isntance_root_block_device.volume_type
    }
  }

  tags = var.ec2_instance_tags
}