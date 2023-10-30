resource "yandex_container_registry" "stage" {
  name = "stage"
}

resource "yandex_container_repository" "my-repository" {
  name = "${yandex_container_registry.stage.id}/admin-cms"
}