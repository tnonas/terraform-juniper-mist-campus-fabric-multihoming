# Create org network template for switches
resource "mist_org_networktemplate" "this" {
  org_id                                  = var.org_id
  name                                    = join("", [var.name-prefix, var.switch_template.name])
  networks                                = var.switch_template.networks
  port_usages                             = var.switch_template.port_usages
  # disabled_system_defined_port_usages     = var.switch_template.disabled_system_defined_port_usages # unsupported by the provider
  switch_matching                         = var.switch_template.switch_matching
}