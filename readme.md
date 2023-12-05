Requirements:
1) Terraform
2) AWS CLI
    * Must be configured

Commands to deploy the application:
1) terraform init
2) terraform plan -out "plan.tfplan"
3) terraform apply "plan.tfplan"
* If you wish to remove the deployment
4) terraform destroy

Improvements that can be made:
* Dockerize the application