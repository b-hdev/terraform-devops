variable "origin_id" {
  type = string
  description = "S3 id"
}

variable "bucket_domain_name" {
  type = string
  description = "S3 bucket domain"
}

variable "cdn_price_class" {
  type = string
  default = "PriceClass_200"
  description = "CDN price class"
}

variable "cdn_tags" {
  type = map(string)
  default = {}
  description = "Tags for creating"
}