node{
    def customImage
    def registryProject='aurelpere/jenkins-push'
    def IMAGE="${registryProject}:version-${env.BUILD_ID}"

		stage('Build') {
				sh "docker build -t $IMAGE ."
		}
        stage('Run') {

                sh "docker run -d --name run-$BUILD_ID -p 80:80 $IMAGE"
                sh 'curl localhost'
    }
		stage('Login') {
            withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pw', usernameVariable: 'login')]) {
				sh "echo $pw | docker login -u $login --password-stdin"
		}}
		stage('Push') {
				sh "docker push $IMAGE"
		}
	}
	stage ('clean') {
			sh 'docker logout'
            sh "docker rm -f run-$BUILD_ID"
	}


