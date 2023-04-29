variable "ami_id" {
  type = string
  description = "Identificador de la imagen."
}

variable "instance_type" {
    type = string
    description = "Tipo de instancia."
  
}

variable "tags" {
    type = map
    description = "Colección de tags de la instancia."
  
}

variable "sg_name" {
  type = string
  description = "Nombre del security groups"
  
}

variable "ingress_rule" {
  
}

variable "egress_rule" {
  
}

variable "key_name" {
  
}