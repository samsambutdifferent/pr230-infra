# PR230-INFRA

IaC scripts for Project 2030
 
## Related projects

- [pr230-carbon-calculator](https://github.com/samsambutdifferent/pr230-carbon-calculator)
- [pr230-foodprint](https://github.com/samsambutdifferent/pr230-foodprint)
- [pr230-semantic-matcher](https://github.com/samsambutdifferent/pr230-semantic-matcher)

## Prequisites

- [Terrafrom SDK](https://learn.hashicorp.com/collections/terraform/gcp-get-started)
- Admin level access to target GCP project(s)


## Overview

```md
project
│   README.md
│   .gitgnore    
│   
└───pr230
    │   all .tf config files for dev project
```


## Project Setup Process

Change directory to the target project folder.

### Service Account

Create Infra Service Account: infra-service-account@{PROJECT-NAME}.iam.gserviceaccount.com with correct permissions:

- editor
- Security Admin
- Service Account Admin
- Cloud Run Admin
- Secret Manager Admin

Create key for infra service admin and add to {PROJECT-NAME}/key.json file

### State storage

Terraform state is backed up onto gcs through terraform backend. Before deploying to a new environment a GCS bucket will need to be created in the project region Bucket Name: tf-state-{PROJECT-NAME}

```bash
Bucket Name: tf-state-{PROJECT-NAME}
```

The backend is then set up the terraform config block in main.tf i.e.

```json
  backend "gcs" {
    bucket  = "tf-state-{PROJECT-NAME}"
    prefix  = "terraform/state"
    credentials = "./path-to-key.json"
  }
```


### Terraform

#### Intialise

```bash
    terraform init
```

#### Apply

```bash
    terraform refresh (not always needed)

    terraform apply
```

#### Check

```bash
    terraform show
```

#### Destroy

```bash
    terraform destroy
```

#### Remove

can be useful if state gets stuck...

```bash
terraform state rm [NAME]
```


### Source Repos

Manualy link the github repos from the cloud console UI

### Run cloud build scripts

Manualy run the deployed application scripts to create images for the cloud run instances