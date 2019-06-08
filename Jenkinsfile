pipeline {
  agent any
  parameters {
    string(name: 'Terraform', defaultValue: 'plan', description: 'Enter Terraform Option(plan/apply/delete)')
    string(name: 'Push', defaultValue: 'false', description: 'Push Image into ECR?')
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
	  sh 'cd ./docker/'
      sh 'docker build .'
	  }
    }
  }
}