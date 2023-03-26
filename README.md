### Azure Terraform Demo 

It uses [Terraform Cloud](https://app.terraform.io/app) to manage the [Terraform state](https://app.terraform.io/app/altfatterz/workspaces/azure-terraform-demo/states)  

The following environment variables are set in `Terraform Cloud` in order for `Terraform` to successfully authenticate to `Azure`.

```
ARM_CLIENT_ID
ARM_TENANT_ID
ARM_CLIENT_SECRET
ARM_SUBSCRIPTION_ID
```

To set the value you need to create a service principal using:

```bash
$ az ad sp create-for-rbac --name="terraform-create-vm" --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"
```

Take the `SUBSCRIPTION_ID` from:

```bash
$ az account show
```

The command returns:

```bash
{
"appId": "<ID>", --> ARM_CLIENT_ID
"displayName": "terraform-create-vm", 
"password": "<ID>", -->  ARM_CLIENT_SECRET (sensitive)
"tenant": "<ID>"  -->  ARM_TENANT_ID
}
```

To retrieve it back

```bash
$ az ad sp list --all -o table | grep terraform
$ az ad sp list --display-name terraform-create-vm
```

In Azure Portal you can view this resource in `App registrations`

Useful commands:

```bash
$ terraform fmt
$ terraform validate
$ terraform plan
$ terraform apply
$ terraform output
```

### Notes:

`.terraform.lock.hcl` file should be committed to your repository to ensure that the same provider versions 
are used when `terraform init` is run again in the future. 