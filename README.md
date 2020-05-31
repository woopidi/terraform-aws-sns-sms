# SNS SMS

```sh
module "example" {
    source         = "git::https://gitlab.woopidi.net/terraform/sns-sms.git"
    topic_name     = "example"
    subscribers    = {
        "user_name": "phonenumber",
        "user_name": "phonenumber",
    }
}
```