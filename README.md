<h1>Azure PowerShell script to bulk execute cmd commands</h1>

<h2>Summary</h2>
<p>System administrators often need to run commands on client machines as part of their job. For instance, a system administrator may do a GPO configuration and then run <code>gpupdate /force</code> to force the GPO configuration changes to be applied immediately, or he may need to run <code>ipconfig /all</code> to start trying to figure out a networking problem on a specific machine. This workflow of going to the specific machine where we need to execute the commands and simply typing them out may be good when working with a small number of computers. Nevertheless, this falls short when working with 20 or 30 clients at the same time</p>
<p>For instance, say you need to execute <code>gpupdate /force</code> on 30 machines; well, even if it just takes you 5 minutes to go and manually execute it for each machine, that time would quickly add up to 150 minutes or about 2 and a half hours.</p>
<p>In this project, I showcase a PowerShell script that aims to solve that problem by allowing the user to execute multiple cmd scripts on various machines at the same time in a matter of minutes. Thus, greatly reducing the time a system administrator would need to put into the task</p>

<h2>List of Prerequisites</h2>

- To have a VM or physical computer where you want to install osTicket

<h2>Features</h2>

- Execute one or more commands on multiple remote computers
- Allow the user to select the target computers from a visual GUI or file
- Display execution results to the screen
- Log execution results to file

<h2>Index</h2>
<p>Maybe remove the index</p>

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

<p>And here you explain it line by line</p>

<h2>Demostration</h2>
<p>Add a table with times like you often like to do, bruh</p>

<h2>Intended use cases</h2>
<h2>Intended usege considerations</h2>
<p>Add the fact that the display GPO needs additional configuration</p>
<p>Problems on different operationg systems</p>
<p>Add the fact that the VM needs to be turned on</p>
<h2>Configurable features</h2>
<p>Add stuff like executing the script from a file</p>
<p>And saving the results to a file</p>
<p>Formating saved results</p>

<h2>Related projects</h2>
<p>And you add the dhcp here</p>
