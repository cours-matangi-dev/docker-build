node{
  def customImage
  def registryProject='aurelpere/jenkins-push'
  def IMAGE="${registryProject}:version-${env.BUILD_ID}"

    stage('Clone') {
        checkout scm    
}
   
    stage('Build image') {
        customImage=docker.build("$IMAGE", '.')
    }

    stage('Run') {
        docker.image("$IMAGE").withRun("--name run-$BUILD_ID -p 80:80") {c ->
            sh 'curl localhost'
            }
    }

    stage('Push') {
        docker.withRegistry('','dockerhub') { 
        customImage.push()
	     }
    }
}

