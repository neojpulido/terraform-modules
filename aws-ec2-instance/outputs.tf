output "instance_ip" {
    value = aws_instance.tfprod_docker.public_ip
}