variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-blog-prod"
}

variable "location" {
  description = "The Azure region where the resource group should be created"
  type        = string
  default     = "westeurope"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default = {
    Environment = "Production"
    Project     = "Blog"
  }
}

variable "static_web_app_name" {
  description = "The name of the static web app"
  type        = string
  default     = "stapp-blog-prod"
}
