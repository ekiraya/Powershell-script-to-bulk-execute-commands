<h1>Azure PowerShell script to bulk execute cmd commands</h1>

<h2>Summary</h2>
<p>System administrators often need to run commands on client machines as part of their job. For instance, a system administrator may do a GPO configuration and then run <code>gpupdate /force</code> to force the GPO configuration changes to be applied immediately, or he may need to run <code>ipconfig /all</code> to start trying to figure out a networking problem on a specific machine. This workflow of going to the specific machine where we need to execute the commands and simply typing them out may be good when working with a small number of computers. Nevertheless, this falls short when working with 20 or 30 clients at the same time</p>
<p>For instance, say you need to execute <code>gpupdate /force</code> on 30 machines; well, even if it just takes you 5 minutes to go and manually execute it for each machine, that time would quickly add up to 150 minutes or about 2 and a half hours.</p>
<p>In this project, I showcase a PowerShell script that aims to solve that problem by allowing the user to execute multiple cmd scripts on various machines at the same time in a matter of minutes. Thus, greatly reducing the time a system administrator would need to put into the task</p>

<p>Add a table with times like you often like to do, bruh</p>

<h2>List of Prerequisites</h2>

- To have a VM or physical computer where you want to install osTicket

<h2>How it works</h2>

```commandline
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
```
<h2>Usage walkthrough</h2>
<h2>Intended usage cases</h2>
<p>Add the fact that the VM needs to be turned on</p>
