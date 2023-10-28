node {    
	stage ("Init and plan resources")
		dir ('/data/yandex_compute_cloud/terraform/k8s_cluster') {
            sh 'terraform init && terraform plan'
        }
    
    stage ("Creating k8s-cluster") {
        dir ('/data/yandex_compute_cloud/terraform/k8s_cluster') {
            sh 'terraform apply -auto-approve'
        }
    }

   /* stage 'Update kube-config' {
        sh 'rm -rf /data/.kube/* \
            && yc k8s cluster get-credentials --name k8s-cluster-01 --external'
    } */
} 