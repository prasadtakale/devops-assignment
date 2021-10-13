# Flask project

`Flask project` contains a working example of a Flask project with features:

- Simple web requests which will show `Hello World` flask project 
- Contains `Dockerfile` that allows to setup full Linux environment on any host OS supported by Docker
- Created AWS EC2 instance and application load balancer using terraform.
- Created Jenkins job which will build the docker image and push the new image to docker hub.
- Docker image tag will be `flask-v${env.BUILD_ID}` where env.BUILD_ID will be jenkins job build number.
- Once docker image get build new docker image gets deployed on EC2 instance using ansible playbook

# Directory Structure 

        ├── README.md
        ├── ansible
        │   ├── deploy-docker.yml
        │   └── server
        ├── app
        │   ├── Dockerfile
        │   ├── __pycache__
        │   ├── app.py
        │   └── requirements.txt
        └── terraform
            ├── alb_sg.tf
            ├── application_lb.tf
            ├── ec2_intance.tf
            ├── ec2_sg.tf
            └── variables.tf

- `ansible` directory has all required file to deploy application on EC2 instance
- `app` directory has flask application python file and `Dockerfile` which will create docker container.
- `terraform` directory has all the tf files which will create required AWS resources 