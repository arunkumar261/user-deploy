variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    Project = "roboshop"
    Environment = "dev"
    Terraform = "true"
  }
}

variable "zone_name" {
  default = "arundev.online"
}


variable "tags" {
    default = {
        Component = "user"
    }
  
}
 
variable "app_version" {
  
}

variable "iam_instance_profile" {
  default = "ShellScriptRoleForRoboshop"
}