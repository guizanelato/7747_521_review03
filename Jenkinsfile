pipeline {

  agent{
		
		label "vm-developer"

	}

	environment {
		registry = "guizanelato/python_flask"
		registryCredentials = 'dockerhub_registry'	

	}


	stages {
	  stage('checkout repo'){
		  steps{
			   cleanWs()
				 git "https://github.com/guizanelato/7747_521_review03.git"

			}
		}
		
		stage('build da imagem'){
			steps{
				script{
						imagem = docker.build(registry+"$BUILD_NUMBER")
				}
			}		
		}

		stage('testes'){
			steps{
				script{
					imagem.inside("--name pyapp --network=review03_nova_rede --ip=200.100.50.10"){
						sh "python -m unittest tests/teste_rota.py"
					}
				}
			}		
		}

		stage('subir a imagem para o dockerhub'){
			steps{
				script{
					docker.withRegistry("", registryCredentials){
							imagem.push()					
					}
				}
			}
		}
	}

	post {
		cleanup{
			sh "docker image rmi $registry:$BUILDNUMBER"
		}
	}


}
