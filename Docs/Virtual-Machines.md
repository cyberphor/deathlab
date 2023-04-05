## Virtual Machines

### Password Information
| Role | Username | Password |
| --- | --- | --- |
| Domain Admin | elliot.alderson.da | 1qaz2wsx!QAZ@WSX | 
| User | elliot.alderson | 1qaz2wsx!QAZ@WSX |

### Network Information
| Virtual Machine | Hostname | IP Address | Operating System | Apps |
| --------------- | -------- | ---------- | ---------------- | ---- |
| Firewall | | 192.168.5.254 | FreeBSD | pfsense |
| Domain Controller | XOF5000DC1 | 192.168.1.5 | Windows Server 2019 | Active Directory |
| Email Server | XOF5000APP | 192.168.1.11 | Windows Server 2019 | Mail Server |
| Event Collector | XOF5000APP | 192.168.1.12 | Windows Server 2019 | Winlogbeat |
| SIEM Server | XOF5000APP | 192.168.1.13 | CentOS 7 | Elasticsearch <br> Logstash <br> Kibana |
| Workstation | XOF5000WK1 | 192.168.1.69 | Windows 11 | Chrome |
| Adversary | XOF5000WK1 | DHCP Lease | Kali Linux | Hacker Tools |