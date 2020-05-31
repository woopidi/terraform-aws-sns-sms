variable "topic_name" {

}

variable "subscribers" {
    type = object({"name" = string})
}
