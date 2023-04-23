# Running and Deploying Neutlan Models 
This repository contains our project models. You can run each model separately or together using Makefile.

## Prerequisites
Before you can run the models, you'll need to install the following software:

**Docker:** https://docs.docker.com/get-docker/

**Docker Compose:** https://docs.docker.com/compose/install/

## Running the Models
Follow these steps to run the models:

Clone the repository to your local machine:

`git clone [https://github.com/<username>/<repository-name>.git](https://github.com/NEUTLAN/neutlan.model.deployment.git)`

Navigate to the cloned repository directory:

`cd neutlan.model.deployment`

Start all models:

`make`

Start just the CNN model: 

`make cnn`

Start just the paraphrase model:

`make recommend`

To stop all containers and clean up resources: 

`make clean`

To stop just the CNN container:

`make clean-cnn`
