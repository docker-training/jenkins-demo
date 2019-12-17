pipeline {    

    agent any    

    environment {
        DTR_FQDN_PORT = credentials('dtr-fqdn-port')
    }

    stages {
        stage('Build') {
            environment {
                DTR_ACCESS_KEY = credentials('jenkins-dtr-access-token')
            }
            steps {
                sh 'docker image build \
                    -t ${DTR_FQDN_PORT}/engineering/jenkins-demo:build-${BUILD_ID} .'
                sh 'docker login -u jenkins -p ${DTR_ACCESS_KEY} ${DTR_FQDN_PORT} ; \
                    docker image push ${DTR_FQDN}/engineering/jenkins-demo:build-${BUILD_ID}'
            }
        }
    }
}
