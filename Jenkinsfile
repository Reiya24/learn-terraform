
pipeline {

  agent {
    node {
      label "muf"
    }
  }

  tools {go "golang:1.20.3"}

  environment {
    SONARQUBE_LINK_GLOBAL = credentials('SONARQUBE_LINK_GLOBAL')
    REPOSITORY_NAME = sh(returnStdout: true, script: 'echo ${JOB_NAME} | cut -d "/" -f1').trim()
    HOME = '.'
  }

  options {
    disableConcurrentBuilds()
    timeout(time: 30, unit: 'MINUTES')
    buildDiscarder(logRotator(daysToKeepStr: "7",artifactDaysToKeepStr: "7"))
  }

  stages {
    stage('Performing SonarQube Analysis') {
      environment {
        SCANNERHOME = tool 'SONARSCANNER'
      }
      steps {
        withSonarQubeEnv('SONARQUBE_SERVER') {
          sh """
          ${SCANNERHOME}/sonar-scanner-4.8.0.2856-linux/bin/sonar-scanner \
          -D sonar.projectKey=${REPOSITORY_NAME}:${env.BRANCH_NAME} \
          -D sonar.projectName=${REPOSITORY_NAME}:${env.BRANCH_NAME} \
          """
        }
      }
    }
  }
}