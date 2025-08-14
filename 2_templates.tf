# Create org network template for switches
resource "mist_org_networktemplate" "this" {
  for_each                                = var.switch_template
  org_id                                  = var.org_id
  name                                    = join("", [var.name-prefix, each.value.name])
  networks                                = each.value.networks
  port_usages                             = each.value.port_usages
  # disabled_system_defined_port_usages     = each.value.disabled_system_defined_port_usages # unsupported by the provider
  switch_matching                         = each.value.switch_matching
}