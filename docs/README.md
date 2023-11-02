## Virtual Machines

### Identity Information
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