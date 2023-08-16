pipeline {
    
    environment {
        registry = "834584863949.dkr.ecr.ap-south-1.amazonaws.com/mfh-sample-docker"
        registryCredential = "Jenkins-ECR-Login-Credentials"
        dockerImage = ""
    }
    
    tools {
        maven "MAVEN"
    }

    agent any
    
    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sarbajitD-24/Springboot-EmployeeManagement-CRUD-Public.git'
            }
        }    
        
        stage('Build & Sonar Quality Check') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh "mvn clean verify sonar:sonar -Dsonar.projectKey=EmployeeManagement -Dsonar.projectName='EmployeeManagement' -Dsonar.host.url=http://localhost:9000 -Dsonar.qualitygate.wait=true"
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":latest"
                }
            }
        }
        
        stage('Push Image to Amazon ECR') {
            steps {
                script {
                    docker.withRegistry( "http://" + registry, "ecr:ap-south-1:" + registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
    
    post {
        always{
            emailext mimeType: 'text/html',
            attachLog: true, 
            attachmentsPattern: 'generatedFile.txt',
            subject: '$DEFAULT_SUBJECT',
            body: '$DEFAULT_CONTENT',
            to: '$DEFAULT_RECIPIENTS'
        }
    }
}

