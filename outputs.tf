output "ubuntu_public_ip" {
  value = aws_instance.ubuntu.public_ip
}

output "amazon_linux_private_ip" {
  value = aws_instance.amazon_linux_instance.private_ip
}
