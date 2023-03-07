// Global Variable goes here// Pipeline block
pipeline {
   // Agent block
   agent { node { label 'master'}}

   options {
      buildDiscarder(logRotator(numToKeepStr: '30'))
      timestamps()
   }

   parameters {
      string(
         name: "Branch_Name", 
         defaultValue: 'jenkins', 
         description: '')

      string(
            name: "Image_Name", 
            defaultValue: 'basic-elixir-app', 
            description: '')

      string(
            name: "Image_Tag", 
            defaultValue: 'latest', 
            description: 'Image tag')

      booleanParam(
           name: "PushImage", 
           defaultValue: false)
    }

   stages {
      stage('Docker push'){
         steps{
            withDockerServer([uri: "tcp://localhost:2375", credentialsId: ""]) {
               withDockerRegistry([url: "https://172.20.50.53/", credentialsId: ""]) {
                  sh '''
                     docker build -t my_kubelabtest -f Dockerfile .
                     docker tag mykubelabtest 172.20.50.53/basic_elixir_app:latest
                     docker push 172.20.50.53/basic_elixir_app:latest
                  '''
               }
            }
         }
      }
   }
}
