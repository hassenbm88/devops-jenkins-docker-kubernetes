pipeline{
    agent any
    tools {
        maven 'MAVEN'
    }
    stages {
        stage('Build Maven') {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '18558545-93a9-448f-bf74-85184c601676', url: 'https://github.com/hassenbm88/devops-jenkins-docker-kubernetes.git']]])
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
                
            }
        }
    
        stage('Build Docker Image') {
            steps {
                script {
                  sh 'docker build -t hsounabm/devops-app-1.0 .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                 withCredentials([string(credentialsId: 'hsounabm', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u hsounabm -p ${dockerhubpwd}'
                 }  
                 sh 'docker push hsounabm/devops-app-1.0'
                }
            }
        }
        stage('Deploy to k8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deployment.yaml', kubeconfigId: 'minikube')
                }
            }
        }
    }   
}
