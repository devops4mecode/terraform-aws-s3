<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform AWS S3
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    Terraform module to create default S3 bucket with logging and encryption type specific features.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v0.13-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="Licence">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/clouddrove/terraform-aws-s3'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+AWS+S3&url=https://github.com/clouddrove/terraform-aws-s3'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+AWS+S3&url=https://github.com/clouddrove/terraform-aws-s3'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>

## Prerequisites

This module has a few dependencies: 

- [Terraform 0.13](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Go](https://golang.org/doc/install)
- [github.com/stretchr/testify/assert](https://github.com/stretchr/testify)
- [github.com/gruntwork-io/terratest/modules/terraform](https://github.com/gruntwork-io/terratest)

## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/devops4mecode/terraform-aws-s3/releases).


Here are some examples of how you can use this module in your inventory structure:
### Basic Bucket
```hcl
module "s3_bucket" {
  source              = "devops4mecode/s3/aws"
  version             = "1.0.0"
  name                = "secure-bucket"
  application         = "devops4me"
  environment         = "test"
  label_order         = ["environment", "application", "name"]
  versioning          = true
  acl                 = "private"
  bucket_enabled      = true
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| acl | Canned ACL to apply to the S3 bucket. | `string` | `""` | no |
| application | Application (e.g. `cd` or `clouddrove`). | `string` | `""` | no |
| attributes | Additional attributes (e.g. `1`). | `list` | `[]` | no |
| aws\_iam\_policy\_document | Specifies the number of days after object creation when the object expires. | `string` | `""` | no |
| bucket\_enabled | Enable simple S3. | `bool` | `false` | no |
| bucket\_encryption\_enabled | Enable encryption of S3. | `bool` | `false` | no |
| bucket\_logging\_enabled | Enable logging of S3. | `bool` | `false` | no |
| bucket\_logging\_encryption\_enabled | Enable logging encryption of S3. | `bool` | `false` | no |
| bucket\_policy | Conditionally create S3 bucket policy. | `bool` | `false` | no |
| create\_bucket | Conditionally create S3 bucket. | `bool` | `true` | no |
| delimiter | Delimiter to be used between `organization`, `environment`, `name` and `attributes`. | `string` | `"-"` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| force\_destroy | A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable. | `bool` | `false` | no |
| kms\_master\_key\_id | The AWS KMS master key ID used for the SSE-KMS encryption. This can only be used when you set the value of sse\_algorithm as aws:kms. The default aws/s3 AWS KMS master key is used if this element is absent while the sse\_algorithm is aws:kms. | `string` | `""` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list` | `[]` | no |
| lifecycle\_days\_to\_expiration | Specifies the number of days after object creation when the object expires. | `number` | `365` | no |
| lifecycle\_days\_to\_glacier\_transition | Specifies the number of days after object creation when it will be moved to Glacier storage. | `number` | `180` | no |
| lifecycle\_days\_to\_infrequent\_storage\_transition | Specifies the number of days after object creation when it will be moved to standard infrequent access storage. | `number` | `60` | no |
| lifecycle\_expiration\_enabled | Specifies expiration lifecycle rule status. | `bool` | `false` | no |
| lifecycle\_expiration\_object\_prefix | Object key prefix identifying one or more objects to which the lifecycle rule applies. | `string` | `""` | no |
| lifecycle\_glacier\_object\_prefix | Object key prefix identifying one or more objects to which the lifecycle rule applies. | `string` | `""` | no |
| lifecycle\_glacier\_transition\_enabled | Specifies Glacier transition lifecycle rule status. | `bool` | `false` | no |
| lifecycle\_infrequent\_storage\_object\_prefix | Object key prefix identifying one or more objects to which the lifecycle rule applies. | `string` | `""` | no |
| lifecycle\_infrequent\_storage\_transition\_enabled | Specifies infrequent storage transition lifecycle rule status. | `bool` | `false` | no |
| managedby | ManagedBy, eg 'CloudDrove' or 'AnmolNagpal'. | `string` | `"anmol@clouddrove.com"` | no |
| mfa\_delete | Enable MFA delete for either Change the versioning state of your bucket or Permanently delete an object version. | `bool` | `false` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| sse\_algorithm | The server-side encryption algorithm to use. Valid values are AES256 and aws:kms. | `string` | `"AES256"` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`). | `map` | `{}` | no |
| target\_bucket | The name of the bucket that will receive the log objects. | `string` | `""` | no |
| target\_prefix | To specify a key prefix for log objects. | `string` | `""` | no |
| versioning | Enable Versioning of S3. | `bool` | `false` | no |
| website\_error | An absolute path to the document to return in case of a 4XX error. | `string` | `"error.html"` | no |
| website\_hosting\_bucket | Enable website hosting of S3. | `bool` | `false` | no |
| website\_index | Amazon S3 returns this index document when requests are made to the root domain or any of the subfolders. | `string` | `"index.html"` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the s3 bucket. |
| bucket\_domain\_name | The Domain of the s3 bucket. |
| id | The ID of the s3 bucket. |
| tags | A mapping of tags to assign to the resource. |

## Testing
In this module testing is performed with [terratest](https://github.com/gruntwork-io/terratest) and it creates a small piece of infrastructure, matches the output like ARN, ID and Tags name etc and destroy infrastructure in your AWS account. This testing is written in GO, so you need a [GO environment](https://golang.org/doc/install) in your system. 

You need to run the following command in the testing folder:
```hcl
  go test -run Test
```