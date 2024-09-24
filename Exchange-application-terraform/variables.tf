variable "region" {
  type        = string
  default     = "us-east-1"
  description = "default region"
}

variable "zone1" {
  type    = string
  default = "us-east-1a"
}

variable "zone2" {
  type    = string
  default = "us-east-1b"
}

variable "vpc_cidr" {
  type        = string
  default     = "172.16.0.0/16"
  description = "default vpc_cidr_block"
}

variable "pub_sub1_cidr_block" {
  type    = string
  default = "172.16.1.0/24"
}

variable "pub_sub2_cidr_block" {
  type    = string
  default = "172.16.2.0/24"
}
variable "prv_sub1_cidr_block" {
  type    = string
  default = "172.16.3.0/24"
}
variable "prv_sub2_cidr_block" {
  type    = string
  default = "172.16.4.0/24"
}

variable "sg_name-front" {
  type    = string
  default = "alb_sg-front"
}

variable "sg_name-back" {
  type    = string
  default = "alb_sg-back"
}


variable "sg_description" {
  type    = string
  default = "SG for application load balancer"
}

variable "backend-sg" {
  type    = string
  default = "SG for backend"
}

variable "sg_tagname_front" {
  type    = string
  default = "SG for ALB frontend"
}

variable "sg_tagname_back" {
  type    = string
  default = "SG for ALB backend"
}

variable "sg_ws_name" {
  type    = string
  default = "webserver_sg"
}


variable "sg_ws_api" {
  type    = string
  default = "SG for backend"
}

variable "sg_ws_web" {
  type    = string
  default = "SG for frontend"
}


variable "sg_backend_tagname" {
  type    = string
  default = "SG for backend"
}

variable "profile" {
  type    = string
  default = "default"
}

variable "instance-type" {
  type    = string
  default = "t2.micro"
}


variable "app-port" {
  type    = number
  default = 80
}

variable "temp-port" {
  type    = number
  default = 3001
}


variable "backend-port" {
  type    = number
  default = 3000
}

variable "db-port" {
  type    = number
  default = 5432
}

variable "ssh-port" {
  type    = number
  default = 22
}



variable "record_name" {
  default     = "exchangeapp.com"
  description = "sub domain name"
  type        = string


}

variable "hosted_zone" {
  description = "hosted zone id"
  type        = string

}

variable "db_secret_url" {
  description = "exchangeapp-secret-url"
  type        = string

}

variable "frontend-ami" {
  description = "exchangeapp frontend-ami-id"
  type        = string

}

variable "backend-ami" {
  description = "exchangeapp backend-ami-id"
  type        = string

}


