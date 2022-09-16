node{
    def customImage
    def registryProject='aurelpere/jenkins-push'
    def IMAGE="${registryProject}:version-${env.BUILD_ID}"

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t $IMAGE .'
			}
		}
        stages('Run') {
            steps {
                sh 'docker run --name run-$BUILD-ID -p 80:80 $IMAGE'
                sh 'curl localhost'
            }
    }

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push $IMAGE'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
