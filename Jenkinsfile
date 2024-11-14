pipeline {
    agent any

    environment {
        CI = 'true'
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the repository
                git 'https://github.com/your-repo-url.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install dependencies
                sh 'npm install'
            }
        }

        stage('Run Cypress Tests') {
            steps {
                // Run the Cypress tests
                sh 'npx cypress run'
            }
        }

        stage('Build Next.js') {
            steps {
                // Build the Next.js application for production
                sh 'npm run build'
            }
        }

        stage('Health Check') {
            steps {
                // Perform any necessary health checks
                sh 'curl --fail http://localhost:3000 || exit 1'
            }
        }

        stage('Deploy to Netlify') {
            steps {
                // Deploy to Netlify
                sh 'netlify deploy --prod'
            }
        }
    }

    post {
        always {
            // Always archive test results
            junit 'cypress/results/*.xml'  // Assuming test results are exported in JUnit format
        }
        failure {
            // Notify on failure
            mail to: 'your-email@example.com',
                subject: 'Cypress Tests Failed',
                body: "Cypress tests failed. Check Jenkins logs for details."
        }
    }
}
