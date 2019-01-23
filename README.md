# Kubernetes DO Configuration

Repository containing some theory about Kubernetes and how to set up a master and a node using it on Digital Ocean infrastructure provider. All these steps may change as the time goes by, so have in mind that these steps were executed by [me](https://www.linkedin.com/in/levindo) in January 2019.

**Author:** Levindo Gabriel Taschetto Neto.

## Theory
TO DO.

## Set Up a Master
Follow the steps on the [Master Config](master-config.sh) on the Master droplet.

TO DO: Put more details.

## Set Up a Node
Follow the steps on the [Node Config](node-config.sh) on the Node droplet.

TO DO: Put more details.

## Result

![node-1_to_master-1](resources/node-1_to_master-1.png)

## How to Access the Cluster from a Local Machine
### On Windows 10

#### Install Kubernetes CLI (via Chocolatey Package Manager)

1.  Install Chocolatey
  1.  Open the *cmd* as an administrator.
  2.  Execute the following command:
```
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```

2. On the same cmd, run:
```
choco install kubernetes-cli
```


#### Get the Settings from the Master
1. Go to the Master
2. Run the following commands to see if you've got what it takes!:
```
cd /etc/kubernetes
cat kubelet.conf
```
3. Go to the local machine, and run:
``
scp root@<IP_MACHINE_HERE>:/etc/kubernetes/kubelet.conf
```

## License

MIT License. Click [here](LICENSE.md) for more information about this license.
