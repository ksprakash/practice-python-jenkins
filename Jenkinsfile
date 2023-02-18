node {

    stage("Checkout"){
        checkout([
        $class: 'GitSCM',
        branches: [["name":"origin/release-1.0"]],
        doGenerateSubmoduleConfigurations: scm.doGenerateSubmoduleConfigurations,
        extensions: scm.extensions,
        userRemoteConfigs: [["url": "https://github.com/ksprakash/practice-python-jenkins"]],
        depth: 1
    ])
        
    }

    stage("Build"){
        def tagname = currentBuild.number
        def image = docker.build('vijayasurya/python:v'+tagname)
        stash name: "savedfile", includes: "test_uppercase.py" 
    }
    stage('UnitTests'){

        def testimage = docker.image('python:latest'){
            testimage.inside{
                unstash "savedfile"
                sh 'cat test_uppercase.py'
                sh "python test_uppercase.py "
            }
        }

    }
    stage("Publish"){
        def tagname = currentBuild.number

        def image = docker.build('vijayasurya/python:v'+tagname)
        docker.withRegistry('https://registry-1.docker.io','docker-credentials'){
        image.push()
        image.push('latest')
        }
        }
    
}