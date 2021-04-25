$randint = Get-Random -Minimum 1000 -Maximum 9999

Arm {
    Resource "stpsarmdemo$randint" -Namespace Microsoft.Storage -Type storageAccounts -ApiVersion 2021-01-01 -Kind StorageV2 -Location 'westus2' {
        ArmSku Standard_LRS
        properties {
            accessTier 'Hot'
            supportsHttpsTrafficOnly $true
            allowBlobPublicAccess $false
            minimumTlsVersion 'TLS1_2'
        }
    }
}