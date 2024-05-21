#!/usr/bin/
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('terraform') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('kubernetes') {
                        sh "aws eks update-kubeconfig --name dev-cluster"
                        sh "kubectl apply -f nginx-deployment.yaml"
                        sh "kubectl apply -f public-lb.yaml"
                    }
                }
            }
        }
    }
}
// pipeline {
//     agent any
//     environment {
//         AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
//         AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
//         AWS_DEFAULT_REGION = "us-east-1"
//     }
//     stages {
//         stage("Delete EKS Resources") {
//             steps {
//                 script {
//                     dir('kubernetes') {
//                         sh "kubectl delete -f nginx-deployment.yaml"
//                         sh "kubectl delete -f public-lb.yaml"
//                     }
//                 }
//             }
//         }
//         stage("Delete EKS Cluster") {
//             steps {
//                 script {
//                     dir('terraform') {
//                         sh "terraform init"
//                         sh "terraform destroy -auto-approve"
//                     }
//                 }
//             }
//         }
//     }
// }
// pipeline {
//     agent any
//     tools {
//         terraform 'terraform-11'
//     }
//     stages{
//         stage('Git Checkout'){
//             steps{
//                 git branch: 'master', credentialsId: 'GithubCredentials', url: 'https://github.com/kunleawsudemy/eks-with-terraform'
//             }
//         }
//         stage('Terraform Init'){
//             steps{
//                 sh 'terraform init -migrate-state'
//             }
//         }
//         stage('Terraform Apply'){
//             steps{
//                 sh 'terraform apply --auto-approve'
//             }
//         }
//     }
// }