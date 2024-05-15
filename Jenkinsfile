pipeline {
    agent {
        node {
            label 'Agent-1'
        }
    }

    options {
        timeout(time: 1, unit: 'HOURS')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }

    parameters {
        string(name: 'version', defaultValue: '', description: 'What is the version to download artifact ?')
        string(name: 'environment', defaultValue: '', description: 'What is the environment for infra ?')
        booleanParam(name: 'Create', defaultValue: false, description: 'Create the infra ?')
        booleanParam(name: 'Destroy', defaultValue: false, description: 'Destroy the infra ?')
    }

    stages {
         stage('Print the version') {
            steps {
            sh """
                echo "version : ${params.version}"
                echo "environment : ${params.environment}"
            """
            }
        }

        stage('Init') {
            steps {
                sh """
                cd terraform
                    terraform init --backend-config=${params.environment}/backend.tf -reconfigure   
                """
            }
        }
        stage('Plan') {
            steps {
                sh """
                cd terraform
                     terraform plan -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}"
                """
            }
        }
        stage('Apply') {
            // when {
            //     expression {
            //         params.Create
            //     }
            // }
            steps {
                sh """
                cd terraform
                     terraform apply -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}" -auto-approve
                """
            }
        }

        stage('Destroy') {
            when {
                expression {
                    params.Destroy
                }
            }
            steps {
                sh """
                cd terraform
                     terraform destroy -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}" -auto-approve
                """
            }
        }
    }
    post {
        always {
            echo "I will always say Hello"
            deleteDir()
        }
        failure {
            echo "I will say Hello only pipeline fails"
        }
        success {
            echo "I will say Hello only pipeline success"
        }
    }
}