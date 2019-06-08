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
	    sh 'aws configure set aws_access_key_id AKIA3SVNO4LDSSLAXVAV'
		sh 'aws configure set aws_secret_access_key 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'
        sh '$(aws --no-verify-ssl ecr get-login --no-include-email --region us-west-2)'

        sh 'docker rmi -f 796006474439.dkr.ecr.us-west-2.amazonaws.com/processlink:latest'
        sh 'docker tag ubuntu:latest 796006474439.dkr.ecr.us-west-2.amazonaws.com/processlink:latest'
        sh 'docker push 011821064023.dkr.ecr.us-west-2.amazonaws.com/processlink:latest'
      }
    }
  }
}