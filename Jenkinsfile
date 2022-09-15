node{
  def registryProject='aurelpere/jenkins-push'
  def IMAGE="${registryProject}:version-${env.BUILD_ID}"

    stage('Clone') {
        checkout scm    
}
   
    stage('Build image') {
        docker.build("$IMAGE", '.')
    }

    stage('Run') {
        img.withRun("--name run-$BUILD_ID -p 80:80") {c ->
            sh 'curl localhost'
            }
    }

    stage('Push') {
        docker.withRegistry('https://hub.docker.com,'dockerhub') { 
            img.push 'latest'
            img.push()
	     }
    }
}

