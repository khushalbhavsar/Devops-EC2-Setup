**AWS EC2 (Amazon Linux 2 / Amazon Linux 2023)** and **ec2-user**.

---

# 🚀 AWS EC2 DevOps Setup (Amazon Linux)

This repository provides **production-ready shell scripts** to set up a complete **DevOps toolchain** on an **AWS EC2 instance** running:

✅ Amazon Linux 2
✅ Amazon Linux 2023

**Default user:** `ec2-user`

---

## 📌 Tools Installed

* Docker
* Docker Compose
* Jenkins (CI/CD)
* SonarQube (Code Quality – Dockerized)
* Prometheus (Monitoring)
* Grafana (Visualization)
* EC2 Hardening + Swap Memory

---

## 📁 Project Structure

```
devops-ec2-setup/
│
├── 00-common/
│   ├── system-update.sh
│   ├── aws-ec2-hardening.sh
│   └── swap-memory.sh
│
├── 01-docker/
│   ├── install-docker.sh
│   └── install-docker-compose.sh
│
├── 02-jenkins/
│   └── install-jenkins.sh
│
├── 03-sonarqube/
│   └── install-sonarqube.sh
│
├── 04-prometheus/
│   └── install-prometheus.sh
│
├── 05-grafana/
│   └── install-grafana.sh
│
├── aws-security-group-ports.txt
└── run-all.sh
```

---

## 🖥️ EC2 Instance Requirements

| Requirement   | Value                              |
| ------------- | ---------------------------------- |
| Instance Type | `t2.medium` or higher              |
| Storage       | 20–30 GB                           |
| OS            | Amazon Linux 2 / Amazon Linux 2023 |
| User          | ec2-user                           |

> ⚠️ SonarQube requires **minimum 2 GB RAM**

---

## 🔐 Security Group Configuration

Open the following ports in your EC2 Security Group:

| Port | Service    |
| ---- | ---------- |
| 22   | SSH        |
| 8080 | Jenkins    |
| 9000 | SonarQube  |
| 9090 | Prometheus |
| 3000 | Grafana    |

---

## 🔑 Connect to EC2

```bash
ssh -i your-key.pem ec2-user@<EC2_PUBLIC_IP>
```

---

## 📥 Clone Repository

```bash
git clone https://github.com/<your-username>/devops-ec2-setup.git
cd devops-ec2-setup
```

---

## 🔧 Make Scripts Executable

```bash
chmod +x **/*.sh run-all.sh
```

---

## ▶️ Run Full Setup

```bash
./run-all.sh
```

⏳ Setup time: **10–15 minutes**

---

## 🔄 IMPORTANT (After Setup)

Docker group changes require logout:

```bash
exit
```

Reconnect to EC2:

```bash
ssh -i your-key.pem ec2-user@<EC2_PUBLIC_IP>
```

---

## 🌐 Access Installed Tools

| Tool       | URL                           |
| ---------- | ----------------------------- |
| Jenkins    | `http://<EC2_PUBLIC_IP>:8080` |
| SonarQube  | `http://<EC2_PUBLIC_IP>:9000` |
| Prometheus | `http://<EC2_PUBLIC_IP>:9090` |
| Grafana    | `http://<EC2_PUBLIC_IP>:3000` |

---

## 🔑 Jenkins Initial Admin Password

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

---

## 🔑 Grafana Default Credentials

```
Username: admin
Password: admin
```

(You will be prompted to change it)

---

## 🧪 Verify Installation

```bash
docker --version
docker-compose --version
jenkins --version
systemctl status grafana-server
```

---

## 🛠️ Troubleshooting

### Jenkins not starting?

```bash
sudo systemctl status jenkins
sudo journalctl -u jenkins
```

### SonarQube not accessible?

```bash
docker ps
docker logs sonarqube
```

### Permission denied error?

```bash
bash run-all.sh
```

---

## 🚀 Best Practices Used

* Uses `yum / dnf` (Amazon Linux optimized)
* Runs Dockerized services where applicable
* Secure SSH hardening
* Swap memory for stability
* Systemd-managed services
* Clean folder structure

---

## 📌 Next Enhancements (Optional)

* Nginx Reverse Proxy
* SSL with Let’s Encrypt
* Jenkins pipeline templates
* Terraform + EC2 UserData
* Kubernetes (EKS / Kind)
* ArgoCD + Helm

---

## 👨‍💻 Author

**Khushal Bhavsar**
DevOps | AWS | CI/CD | Cloud Automation

