node{
    def customImage
    def registryProject='aurelpere/jenkins-push'
    def IMAGE="${registryProject}:version-${env.BUILD_ID}"

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}

		stage('Build') {
				sh "docker build -t $IMAGE ."
		}
        stage('Run') {
                sh "docker run -d --name run-$BUILD_ID -p 80:80 $IMAGE"
                sh 'curl localhost'
    }
		stage('Login') {
				sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
		}
		stage('Push') {
				sh "docker push $IMAGE"
		}
	}
	post {
		always {
			sh 'docker logout'
            sh "docker rm -f run-$BUILD_ID"
		}
	}


