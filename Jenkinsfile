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
    
    }
}