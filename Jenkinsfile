pipeline {
    agent any

    environment {
        // Set environment variables for Terraform Enterprise
        TerraformEnterpriseToken = credentials('TerraformEnterpriseToken') // Add a secret text credential with your TFE token
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
        stage('Terraform Login') {
            steps {
                script {
                    // Initialize the Terraform workspace
                    sh "envsubst < terraformrc > ~/.terraformrc"
                } 
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    // Initialize the Terraform workspace
                    sh "terraform init -input=false"
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Create a Terraform plan and save it to a file
                    sh "terraform plan"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Apply the Terraform plan
                    sh "terraform apply --auto-approve"
                }
            }
        }
    }
   
}
