// Create SA
resource "yandex_iam_service_account" "tfstate-stage-ysb-sa" {
  folder_id = var.folder_id
  name      = "tfstate-stage-ysb-sa"
}

// Grant permissions
resource "yandex_resourcemanager_folder_iam_member" "tfstate-stage-ysb-sa-editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.tfstate-stage-ysb-sa.id}"
}

// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "tfstate-stage-ysb-sa-static-key" {
  service_account_id = yandex_iam_service_account.tfstate-stage-ysb-sa.id
  description        = "static access key for object storage"
}

// Use keys to create bucket
resource "yandex_storage_bucket" "tfstate-stage-ysb" {
  access_key = yandex_iam_service_account_static_access_key.tfstate-stage-ysb-sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.tfstate-stage-ysb-sa-static-key.secret_key
  bucket     = "tfstate-stage-ysb"
}