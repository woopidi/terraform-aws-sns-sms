# AWS SNS SMS

```sh
module "example" {
    source         = "git@github.com:woopidi/terraform-aws-sns-sms.git"
    topic_name     = "example"
    subscribers    = {
        "user_name": "phonenumber",
        "user_name": "phonenumber",
    }
}
```