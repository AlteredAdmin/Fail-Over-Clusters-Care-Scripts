# Initialize variables and logging information
$clusterMaintenanceFolder = "C:\ClusterMaintenance"
$logFileName = "$clusterMaintenanceFolder\ClusterMaintenance_$(Get-Date -Format 'yyyyMMdd').log"

# Function to write to log
function Write-Log {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Message
    )
    
    Add-Content -Path $logFileName -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $Message"
}

# Check if the logging directory exists, create it if not
if (-not (Test-Path $clusterMaintenanceFolder)) {
    New-Item -Path $clusterMaintenanceFolder -ItemType Directory | Out-Null
}

# Fetch the cluster name and node name
$clusterName = (Get-Cluster).name
$nodeName = [System.Environment]::MachineName

# Add this information to the log
Write-Log "Cluster Name: $clusterName"
Write-Log "Node Name: $nodeName"

try {
    # Resume the node and move the roles back with immediate failback
    Write-Log "Resuming node $nodeName with immediate failback..."
    Resume-ClusterNode -Name $nodeName -Failback Immediate | Out-Null
    Write-Log "Node $nodeName is now resumed and roles have been failed back immediately."
}
catch {
    Write-Log "Error occurred while resuming node $nodeName with immediate failback: $_"
    exit 1
}

Write-Log "Cluster maintenance operations completed successfully for node $nodeName."
