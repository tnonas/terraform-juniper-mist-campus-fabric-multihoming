# Create initial site containers
resource "mist_site" "this" {
  org_id        = var.org_id
  name          = join("", [var.name-prefix, var.site.name]) # Creating name based on var.name-prefix
  sitegroup_ids = ["${mist_org_sitegroup.this.id}"]
  country_code  = var.site.country_code
  timezone      = var.site.timezone
  address       = var.site.address
  notes         = var.site.notes
  latlng        = var.site.latlng
  networktemplate_id = mist_org_networktemplate.this.id # Assign org switch template
}

# Modify site network template to apply switch root passwords
resource "mist_site_networktemplate" "this" {
  depends_on = [ mist_site.this ] # Both site and site setting must be created first
  site_id = mist_site.this.id
  switch_mgmt = {
    root_password = var.switch_root_password
  }
}

# Assign switches to site
resource "mist_org_inventory" "this" {
  for_each                  = var.switches
  org_id                    = var.org_id
  inventory = {
    (each.key) = {
      site_id                = mist_site.this.id
    }
  }
}

# Name switches
resource "mist_device_switch" "this" {
  # Loop over var.switches
  for_each                = var.switches
  # Get switch device ID by MAC entry found in var.switches. "each_key" defines both mist_org_inventory.this resource and MAC address to look for
  device_id               = provider::mist::search_inventory_by_mac(resource.mist_org_inventory.this[(each.key)], (each.key)).id
  # device_id               = mist_org_inventory.this[each.key].id
  name                    = join("", [var.name-prefix, each.value.name]) # Creating name based on var.name-prefix
  site_id                 = mist_site.this.id
  managed                 = true
}
