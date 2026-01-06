terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_static_web_app" "swa" {
  name                = var.static_web_app_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_tier            = "Free"
  sku_size            = "Free"
  tags                = var.tags
}

resource "azurerm_dns_zone" "dns" {
  name                = var.domain_name
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

resource "azurerm_dns_cname_record" "blog" {
  name                = "blog"
  zone_name           = azurerm_dns_zone.dns.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 300
  record              = azurerm_static_web_app.swa.default_host_name
}

resource "azurerm_static_web_app_custom_domain" "blog" {
  static_web_app_id = azurerm_static_web_app.swa.id
  domain_name       = "blog.${var.domain_name}"
  validation_type   = "cname-delegation"
}
