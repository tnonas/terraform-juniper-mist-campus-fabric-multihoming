# Create site group for easier identification
resource "mist_org_sitegroup" "this" {
  org_id = var.org_id
  name   = "Automated by Terraform"
}

# Create org network template for switches
resource "mist_org_networktemplate" "this" {
  org_id                                  = var.org_id
  name                                    = join("", [var.name-prefix, var.switch_template.name])
  networks                                = var.switch_template.networks
  port_usages                             = var.switch_template.port_usages
  vrf_config                              = var.switch_template.vrf_config
  vrf_instances                           = var.switch_template.vrf_instances
  switch_matching                         = var.switch_template.switch_matching
}