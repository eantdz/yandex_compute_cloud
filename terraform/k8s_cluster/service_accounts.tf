resource "yandex_iam_service_account" "k8s-editor" {
  name        = "k8s-editor"
}

resource "yandex_resourcemanager_folder_iam_binding" "k8s-editor" {
  folder_id = var.folder_id

  role = "editor"

  members = [
    "serviceAccount:${yandex_iam_service_account.k8s-editor.id}",
  ]
}

resource "yandex_iam_service_account" "k8s-img-puller" {
  name        = "k8s-img-puller"
}

resource "yandex_resourcemanager_folder_iam_binding" "k8s-img-puller" {
  folder_id = var.folder_id

  role = "container-registry.images.puller"

  members = [
    "serviceAccount:${yandex_iam_service_account.k8s-img-puller.id}",
  ]
}