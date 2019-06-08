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
	    sh 'aws configure set aws_access_key_id AKIA3SVNO4LDQEPB4XZD'
		sh 'aws configure set aws_secret_access_key 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'
        sh '$(aws --no-verify-ssl ecr get-login --no-include-email --region us-west-2)'

        sh 'docker rmi -f 796006474439.dkr.ecr.us-west-2.amazonaws.com/processlink:latest'
        sh 'docker tag ubuntu:16.04 796006474439.dkr.ecr.us-west-2.amazonaws.com/processlink:latest'
        sh 'docker push 796006474439.dkr.ecr.us-west-2.amazonaws.com/processlink:latest'
      }
    }
  }
}