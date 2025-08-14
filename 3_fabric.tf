# Create Campus Fabric
# resource "mist_site_evpn_topology" "this" {
#     for_each            = var.sites
#     site_id             = mist_site.this[each.value.name].id
#     name                = join("", [var.name-prefix, each.value.evpn_fabric.name])
#     evpn_options = {
#         overlay = {
#             as = each.value.evpn_fabric.bgp_local_as
#         }
#         core_as_border = true
#         underlay = {
#             as_base  = each.value.evpn_fabric.as_base
#             use_ipv6 = false
#             subnet   = each.value.evpn_fabric.subnet
#             routed_id_prefix = each.value.evpn_fabric.routed_id_prefix
#         }
#         auto_router_id_subnet = each.value.evpn_fabric.auto_router_id_subnet
#     }
    # switches = {
    #     020004000000 = {
    #         role = "collapsed-core"
    #     },
    #     020004000001 = {
    #         role = "collapsed-core"
    #     },
    #     020004000002 = {
    #         role = "esilag-access"
    #     },
    # }
# }