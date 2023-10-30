variable "cloud_id" {
  type        = string
  description = "Yandex Compute Cloud ID"
}

variable "folder_id" {
  type        = string
  description = "Yandex Compute Cloud Folder ID"
}

variable "default_zone" {
  type        = string
  description = "Default zone"
}

variable "image_id" {
  type        = string
  description = "OS image ID"
}

variable "external_ip" {
  type        = string
  description = "External IPv4 Address"
}
