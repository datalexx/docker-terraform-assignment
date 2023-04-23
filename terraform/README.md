Ensure aws keys are configured:
```
$ aws configure list                                                                  
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile                <not set>             None    None
access_key     ******************** shared-credentials-file    
secret_key     ******************** shared-credentials-file    
    region                eu-west-1      config-file    ~/.aws/config
``` 

Initialize:
```
$ terraform init
```

Format:
```
$ terraform fmt
```

Validate:
```
$ terraform validate
```

Run:
```
$ terraform apply
```

Destroy:
```
$ terraform destroy
```

Tested on:
```
$ terraform version                                                                   
Terraform v1.4.5
on linux_amd64
+ provider registry.terraform.io/hashicorp/aws v4.64.0

$ aws --version
aws-cli/2.11.14 Python/3.10.10 Linux/6.2.12-arch1-1 source/x86_64.arch prompt/off
```