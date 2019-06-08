pipeline {
  agent any
  parameters {
    string(name: 'Terraform', defaultValue: 'plan', description: 'Enter Terraform Option(plan/apply/delete)')
  }
  stages {
    stage('ceraterepo') {
	steps {
      sh './build.sh $Terraform'
	  }
    }
  }
}