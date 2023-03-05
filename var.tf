data "aws_vpc" "my_vpc" {
  id = "vpc-0554a69b91778f81b"
}

variable "subnets" {
  type = map
  default = {
    public-subnet = {
        "name" = "public-subnet"
        "availability_zone" = "us-east-2a"
        "cidr_block" = "10.0.1.0/24"
    }
    private-subnet-1 = {
        "name" = "private-subnet-1"
        "availability_zone" = "us-east-2a"
        "cidr_block" = "10.0.2.0/24"
    }
    private-subnet-2 = {
        "name" = "private-subnet-2"
        "availability_zone" = "us-east-2b"
        "cidr_block" = "10.0.3.0/24"
    }
  }
}








/* # Define the variables for 2 private subnets
variable "private_subnets" {
  type = map(object({
    az   = string
    cidr = string
  }))
  default = {
    subnet1-taha = {
      az   = "us-east-2a"
      cidr = "10.0.2.0/24"
    },
    subnet2-taha = {
      az   = "us-east-2b"
      cidr = "10.0.3.0/24"
    }
  }
}

# Define the variables to 1 public subnet
variable "public_subnet" {
  type = map(object({
    az   = string
    cidr = string
  }))
  default = {
    subnet1-taha-pb = {
      az   = "us-east-2a"
      cidr = "10.0.1.0/24"
    }
  }
} */