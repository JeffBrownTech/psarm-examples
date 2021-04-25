$location = "westus2"
$name = 'prod'
$vnetName  = "vnet-$name-$location-001"
$vnetPrefix = '10.20.0.0/16'
$subnets = @(
    [PsCustomObject]@{Name = 'mgmt'; Prefix = '10.20.2.0/24'},
    [PsCustomObject]@{Name = 'web'; Prefix = '10.20.4.0/24'},
    [PsCustomObject]@{Name = 'db'; Prefix = '10.20.6.0/24'}
)

Arm {
    Resource $vnetName -Namespace Microsoft.Network -Type virtualNetworks -ApiVersion 2020-08-01 -Location $location {
        properties {
            addressSpace {
                addressPrefixes $vnetPrefix
            }

            foreach ($subnet in $subnets) {
                subnets {
                    name $subnet.Name
                    properties {
                        addressPrefix $subnet.Prefix
                    }
                }
            }
        }
    } # End of vnet resource    
}