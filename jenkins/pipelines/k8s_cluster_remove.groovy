node {
	stage ("Delete resources")
		dir ('/data/yandex_compute_cloud/terraform/k8s_cluster') {
            sh 'terraform apply -destroy -auto-approve'
        }
} 