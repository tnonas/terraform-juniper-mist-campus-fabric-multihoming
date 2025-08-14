# Create site group
resource "mist_org_sitegroup" "this" {
  org_id = var.org_id
  name   = "Automated by Terraform"
}