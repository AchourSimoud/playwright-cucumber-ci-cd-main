pipeline {
    agent any
    parameters {
        choice(name: 'ENVIRONMENT', choices: ['integration', 'recette', 'all'], description: 'Sélectionnez l\'environnement')
    }
    stages {
        stage('build and install') {
            agent {
                docker {
                    image 'mcr.microsoft.com/playwright:v1.51.0-noble'
                }
            }

            steps {
                script {
                    //sh 'mkdir -p reports'
                    sh 'npm ci'
                    
                    if (params.ENVIRONMENT == 'all') {
                        sh 'npx cucumber-js --config cucumber.js --tags "not @ignore"'
                    } else {
                        sh "TAGS='@${params.ENVIRONMENT} and not @ignore' npx cucumber-js --config cucumber.js"
                    }
                    stash name: 'allure-results', includes: 'allure-results/*'
                }
            }
        }
    }
    post {
        always {
            unstash 'allure-results' //extract results
            script {
                allure([
                includeProperties: false,
                jdk: '',
                properties: [],
                reportBuildPolicy: 'ALWAYS',
                results: [[path: 'allure-results']]
            ])
            }
        }
    }
}
