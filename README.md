# DevOps EC2 Setup – Amazon Linux

This guide explains **how to run the DevOps EC2–optimized scripts on Amazon Linux (AL2 / AL2023)** to install Docker, Jenkins, SonarQube, Prometheus, and Grafana.

---

## 1. Launch EC2 Instance

1. Go to **AWS Console → EC2 → Launch Instance**
2. Configure:

   * **AMI**: Amazon Linux 2 or Amazon Linux 2023
   * **Instance type**: `t3.medium` (recommended)
   * **Storage**: Minimum **20 GB**
   * **Key pair**: Create or use existing
3. **Security Group – Inbound Rules**

| Port | Purpose    |
| ---- | ---------- |
| 22   | SSH        |
| 8080 | Jenkins    |
| 9000 | SonarQube  |
| 9090 | Prometheus |
| 3000 | Grafana    |

4. Launch the instance

---

## 2. Connect to EC2 Instance

```bash
chmod 400 your-key.pem
ssh -i your-key.pem ec2-user@EC2_PUBLIC_IP
```

---

## 3. Install Git

```bash
sudo yum install git -y
```

---

## 4. Upload / Clone Project

### Option A: Clone from GitHub (Recommended)

```bash
git clone https://github.com/your-username/devops-ec2-setup.git
cd devops-ec2-setup
```

### Option B: Copy from Local Machine

```bash
scp -i your-key.pem -r devops-ec2-setup ec2-user@EC2_PUBLIC_IP:/home/ec2-user/
cd devops-ec2-setup
```

---

## 5. Make Scripts Executable

```bash
chmod +x **/*.sh
```

---

## 6. Run Installation (Recommended Order)

```bash
./run-all.sh
```

⏳ Installation time: **10–15 minutes**

---

## 7. Reboot Instance

```bash
sudo reboot
```

Reconnect after reboot.

---

## 8. Verify Services

### Docker

```bash
docker --version
docker ps
```

### Jenkins

```bash
sudo systemctl status jenkins
```

Initial password:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

### SonarQube

```bash
docker ps | grep sonarqube
```

### Prometheus

```bash
sudo systemctl status prometheus
```

### Grafana

```bash
sudo systemctl status grafana-server
```

---

## 9. Access Applications

Replace `EC2_PUBLIC_IP` with your instance public IP.

| Tool       | URL                       |
| ---------- | ------------------------- |
| Jenkins    | http://EC2_PUBLIC_IP:8080 |
| SonarQube  | http://EC2_PUBLIC_IP:9000 |
| Prometheus | http://EC2_PUBLIC_IP:9090 |
| Grafana    | http://EC2_PUBLIC_IP:3000 |

---

## 10. Default Credentials

### Jenkins

Retrieved during setup

### SonarQube

```
Username: admin
Password: admin
```

### Grafana

```
Username: admin
Password: admin
```

---

## 11. Common Issues & Fixes

### Docker permission denied

```bash
newgrp docker
```

### SonarQube fails on small instance

```bash
free -h
sudo swapon --show
```

### Jenkins not accessible

* Check EC2 security group ports
* Ensure Jenkins is running

---

## 12. Notes

* Use `t3.medium` or higher for stable SonarQube
* For production, restrict security group IPs
* Reverse proxy + SSL recommended

---

## 13. Next Improvements

* Jenkins CI/CD pipeline
* Terraform automation
* Nginx + HTTPS
* Prometheus Node Exporter
* AWS ALB integration

---

**Author:** DevOps EC2 Setup
