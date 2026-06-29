$selected_vms = Get-AzVM | Out-GridView -OutputMode Multiple

$script = @"

#your command goes here

"@

foreach($vm in $selected_vms){

    Write-Host "Currently working on VM:" $vm.Name 

    $reply = Invoke-AzVMRunCommand `
    -VMName $vm.Name `
    -ResourceGroupName $vm.ResourceGroupName `
    -ScriptString $script `
    -CommandId "RunPowerShellScript"

    $reply.Value[0].Message

    Write-Host "---------------------------"

}

