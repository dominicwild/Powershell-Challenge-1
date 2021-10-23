$ServiceName = 'wlidsvc'

foreach($targetHost in Get-Content "$PSScriptRoot\server01.txt"){

    $Service = Get-Service -ComputerName $targetHost | Where-Object {$_.Name -eq $ServiceName}

    #$s = New-PSSession -ComputerName $targetHost

    if($Service.Status -eq 'Stopped'){
        Set-Service -Name $ServiceName -Status Running -PassThru -ComputerName $targetHost
        Write-Host 'Service ' $ServiceName ' has been restarted'
    }

    echo $Service

}
