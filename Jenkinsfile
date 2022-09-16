pipeline{
    agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
        registryProject='aurelpere/jenkins-push'
        IMAGE="${registryProject}:version-${env.BUILD_ID}"
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t ${IMAGE} .'
			}
		}
        stage('Run') {
            steps {
                sh 'docker run -d --name run-${BUILD-ID} -p 80:80 ${IMAGE}'
                sh 'curl localhost'
            }
    }

		stage('Login') {

			steps {
				sh 'echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push ${IMAGE}'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
            sh 'docker rm -f run-${BUILD-ID}'
		}
	}

}
