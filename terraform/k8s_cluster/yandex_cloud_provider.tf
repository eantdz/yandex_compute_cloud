### YC Provider description 
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone      = "ru-central1-a"
  token     = "y0_AgAAAAANeXMbAATuwQAAAADtK5iaFke1lEUjQpajH6rAfJXaZwsnE_U"
  cloud_id  = "b1g5kh7tsmi30fha4g60"
  folder_id = "b1g9pj895q175n8k39ib"
}
