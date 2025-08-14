# Create initial site containers
resource "mist_site" "this" {
  for_each      = var.sites
  org_id        = var.org_id
  name          = join("", [var.name-prefix, each.value.name]) # Creating name based on var.name-prefix
  sitegroup_ids = ["${mist_org_sitegroup.this.id}"]
  country_code  = each.value.country_code
  timezone      = each.value.timezone
  address       = each.value.address
  notes         = each.value.notes
  latlng        = each.value.latlng
}

# Modify site network template to apply switch root passwords
resource "mist_site_networktemplate" "this" {
  depends_on = [ mist_site.this ] # Both site and site setting must be created first
  for_each = var.sites
  site_id = mist_site.this[each.value.name].id
  switch_mgmt = {
    root_password = var.switch_root_password
  }
}
