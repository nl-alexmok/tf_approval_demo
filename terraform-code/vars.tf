variable "region" {
  #default = "eu-central-1" # Frankfurt
  #default = "us-east-2" # Ohio
  #default = "us-west-2" #Oregon
  #default = "ap-southeast-2"
  #default = "us-east-2"
  #default = "eu-west-1"
  default = "ap-east-1"
  description = "the region where you want deploy the solution"
}

variable "prefix" {
    default = "pepapp1"
    description = "The prefix used to build the elements"
}

variable "profile" {
  default = "default"
}
