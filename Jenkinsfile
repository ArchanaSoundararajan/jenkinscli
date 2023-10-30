pipeline {
    agent any

    environment {
        // Set environment variables for Terraform Enterprise
        TF_TOKEN = credentials('TerraformEnterpriseToken') // Add a secret text credential with your TFE token
        TFE_ORG = 'your-org-name'
        TFE_WORKSPACE = 'your-workspace-name'
    }

    stages {
        stage('Checkout') {
            steps {
                // Check out your source code repository
                checkout scm
            }
        }
         
        stage('Terraform Init') {
            steps {
                script {
                    // Initialize the Terraform workspace
                    sh "terraform init"
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Create a Terraform plan and save it to a file
                    sh "terraform plan -out=tfplan"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Apply the Terraform plan
                    sh "terraform apply tfplan"
                }
            }
        }
    }
    post {
        always {
            // Clean up Terraform files
            sh "rm -rf .terraform"
        }
    }
}
