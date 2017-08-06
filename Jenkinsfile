pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Setup go'
                //allow run this file by build agent
                sh "chmod 777 ${WORKSPACE}/src/bitbucket.org/Username/Repository/ci-build.sh"
                //run build
                sh "${WORKSPACE}/src/bitbucket.org/Username/Repository/ci-build.sh"
                
                echo 'Build complete'
            }
        }
        stage('Test') {
            steps {
                echo 'Starting tests'
                sh "chmod 777 ${WORKSPACE}/src/bitbucket.org/Username/Repository/ci-test.sh"
                //run tests
                sh "${WORKSPACE}/src/bitbucket.org/Username/Repository/ci-test.sh"
                echo 'Testing complete'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}