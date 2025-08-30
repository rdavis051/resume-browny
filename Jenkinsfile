pipeline {
    agent any

    environment {
        NETLIFY_SITE_ID = 'YOUR NETLIFY SITE ID'
        NETLIFY_AUTH_TOKEN = credentials('netlify-token')
        REACT_APP_VERSION = "1.0.$BUILD_ID"
    }

    stages {


        stage('AWS S3 Upload') {
            agent {
                docker {
                    image 'amazon/aws-cli'
                    reuseNode true
                    // Use the AWS CLI image to interact with AWS services
                    // Use the --entrypoint='' to avoid running the default entrypoint of the image
                    // This allows us to run the AWS CLI commands directly
                    args "-u root -v /var/run/docker.sock:/var/run/docker.sock --entrypoint=''"
                }
            }
            environment {
                AWS_S3_BUCKET = 'www.robdavisjr.com'
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'my-aws-s3', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
                    sh '''
                        aws --version
                        aws s3 cp templates/index.html s3://$AWS_S3_BUCKET/index.html
                        aws s3 sync static s3://$AWS_S3_BUCKET/static
                    '''
                }
            }
        }
    }
}
