# Campus Fabric Multihoming Design with Juniper Mist
## Description

The module creates a Multihoming Campus Fabric managed by Juniper Mist. [Example topology](https://github.com/tnonas/terraform-juniper-mist-campus-fabric-multihoming/blob/main/README.md):

![The example topology. If it does not render, please refer to the link above.](docs/topology.png)

Note, that only the green colored devices and blue colored IP configuration is covered by the module's automation. The example provided uses this specific addressing. The black and white devices, i.e., PCs, servers and routers are for illustration purposes only and serve as a potential add-on outside the module's scope.

The module creates all Juniper Mist constructs needed for the fully operational environment – sites, switch templates, port profiles, etc.

## Dependencies

- [Juniper Mist account](https://manage.mist.com/signin.html#!signup/register) and an associated Organization ID
- Claimed [Juniper EX or QFX switches](https://www.juniper.net/documentation/us/en/software/mist/content/mist-supported-hardware.html#xd_a679a623514d95d6-669993c-186f9d4ff5a--7e07__section_krr_y15_swb) or adopted [vJunos-switch appliances](https://www.juniper.net/us/en/dm/vjunos-labs.html)

## Example

The example deployment was based on vJunos-switch virtual appliances. Example variables used are provided in module's "example" directory. When copied to the root part of the module (root module) they can be used to configure the provided example topology.
