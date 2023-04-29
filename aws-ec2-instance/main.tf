provider "aws"{
    region="us-east-2"
}

resource "aws_instance" "tfprod_docker" {
    ami=var.ami_id
    instance_type =var.instance_type
    tags = var.tags
    key_name = var.key_name
    security_groups = [aws_security_group.tfprod_sgdocker.name]
}

resource "aws_security_group" "tfprod_sgdocker" {
  name=var.sg_name
 
  dynamic "ingress" {
    iterator = ingress
    for_each = var.ingress_rule
    content {
        description      = ingress.value.description
        from_port        = ingress.value.from_port
        to_port          = ingress.value.to_port
        protocol         = ingress.value.protocol
        cidr_blocks      = ingress.value.cidr_blocks
    }
    
  }

  dynamic "egress" {
    iterator = egress
    for_each = var.egress_rule
    content {
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      protocol         = egress.value.protocol
      cidr_blocks      = egress.value.cidr_blocks
    }
    
  }

}