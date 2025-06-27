pipeline{
    agent any

    stages{
        stage ('pull'){
            steps{
                git changelog: false, poll: false, url: 'https://github.com/bhartikurdhane16/studentapp.ui.git'
                echo 'pull succssed'
            }
        }

        stage ('build'){
            steps{
                sh '/opt/apache-maven-3.9.6/bin/mvn clean package'
                echo 'build successed'
            }
        }

        stage ('test'){
            steps{
                sh '/opt/apache-maven-3.9.6/bin/mvn sonar:sonar -Dsonar.projectKey=studentapp-ui  -Dsonar.host.url=http://13.232.154.79:9000 -Dsonar.login=6cb9b91af5ea13c33111354bd705f300a9fd7c61'
        echo 'test successed'
            }
        }

        stage ('deploy'){
            steps{
                sh "sudo cp /var/lib/jenkins/workspace/studentapp.ui-pipeline/target/studentapp-2.2-SNAPSHOT.war /home/ubuntu/tomcat/webapps/" 
                echo 'deploy stage'
            }
        }
    }

}