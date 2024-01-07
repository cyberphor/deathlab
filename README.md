# Death Lab
Detection Engineering and Threat Hunting (DEATH) Lab is a platform for developing security rules, queries, and playbooks. It was heavily inspired by [DetectionLab](https://github.com/clong/DetectionLab). 
* [Requirements](/docs/requirements/README.md)
* [Installation](#installation)
* [Usage](#usage)
* [Troubleshooting](/docs/troubleshooting/)
* [References](/docs/references/README.md)

## Installation
**Step 1.** Download the software required. 

**Step 2.** Download Death Lab. 
```bash
git clone https://github.com/cyberphor/deathlab
cd deathlab/platform
```

**Step 3.** Login to Azure.
```bash
az login
```

**Step 4.** Set your subscription. 
```bash
az account set --subscription "Personal"
```

**Step 5.** Run Terraform. 
```bash
terraform init
terraform plan
terraform apply -auto-approve
```

**Step 6.** Run Terraform again when you want to tear down Death Lab.
```bash
terraform destroy -auto-approve
```

## Usage
### Account Information
| Role         | Username           | Password         |
| ------------ | ------------------ | ---------------- |
| Domain Admin | elliot.alderson.da | 1qaz2wsx!QAZ@WSX | 
| User         | elliot.alderson    | 1qaz2wsx!QAZ@WSX |

### Network Information
| Virtual Machine   | Hostname | IP Address     | Operating System    | Apps             |
| ----------------- | -------- | -------------- | ------------------- | ---------------- |
| Firewall          | FW01     | 192.168.56.254 | FreeBSD             | pfsense          |
| Workstation       | WK01     | 192.168.56.01  | Windows 11          | Chrome           |
| Domain Controller | DC01     | 192.168.56.129 | Windows Server 2019 | Active Directory |
| Email Server      | MX01     | 192.168.56.130 | Windows Server 2019 | Mail Server      |
| Event Collector   | EC01     | 192.168.56.193 | Windows Server 2019 | Winlogbeat       |
| SIEM Server       | SIEM     | 192.168.56.194 | CentOS 7            | Elastic          |
| Adversary         | APT0     | DHCP Lease     | Kali Linux          | Hacker Tools     |

## Copyright
This project is licensed under the terms of the [MIT license](/LICENSE).
