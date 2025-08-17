# Create Campus Fabric configuration and assign switches
resource "mist_site_evpn_topology" "this" {
  depends_on = [mist_device_switch.this]
  site_id    = mist_site.this.id
  name       = join("", [var.name-prefix, var.evpn_fabric.name])
  evpn_options = {
    core_as_border      = true
    routed_at           = "edge"
    per_vlan_vga_v4_mac = false
    per_vlan_vga_v6_mac = false
    overlay = {
      as = var.evpn_fabric.bgp_local_as
    }
    underlay = {
      as_base  = var.evpn_fabric.as_base
      use_ipv6 = true
      subnet   = var.evpn_fabric.subnet
    }
    auto_router_id_subnet6 = var.evpn_fabric.auto_router_id_subnet6
    auto_router_id_subnet  = var.evpn_fabric.auto_router_id_subnet
  }
  switches = {
    "${var.switches["lab8-core-1"].mac}" = {
      role = "collapsed-core"
    },
    "${var.switches["lab8-core-2"].mac}" = {
      role = "collapsed-core"
    },
    "${var.switches["lab8-access-1"].mac}" = {
      role = "esilag-access"
    }
  }
}
