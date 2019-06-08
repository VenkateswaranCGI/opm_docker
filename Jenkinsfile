pipeline {
  agent any
  parameters {
    string(name: 'Terraform', defaultValue: 'plan', description: 'Enter Terraform Option(plan/apply/delete)')
    string(name: 'Push', defaultValue: 'true', description: 'Push Image into ECR?')
  }
  stages {
    stage('cerate-ecr-repo') {
	steps {
	  sh 'chmod a+x build.sh'
      sh './build.sh $Terraform'
	  }
    }
	stage('build-docker') {
	steps {
      sh 'docker build ./docker/.'
	  }
    }
    stage('push') {
      steps {

        sh 'docker rmi -f 796006474439.dkr.ecr.us-west-2.amazonaws.com/processlink:latest'
        sh 'docker tag ubuntu:16.04 796006474439.dkr.ecr.us-west-2.amazonaws.com/processlink:latest'
        sh 'docker push 796006474439.dkr.ecr.us-west-2.amazonaws.com/processlink:latest'
      }
    }
  }
}