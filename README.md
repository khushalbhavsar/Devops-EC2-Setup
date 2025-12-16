Below are **clear, real-world steps** to run the **AWS EC2–optimized DevOps setup** on a fresh EC2 instance.
Follow this exactly this is how it’s done in production.

---

## 🔹 STEP 1: Launch EC2 Instance (AWS Console)

1. Go to **AWS Console → EC2 → Launch Instance**

2. Configure:

   * **AMI**: Ubuntu Server **22.04 LTS**
   * **Instance Type**:

     * `t3.medium` ✅ (recommended)
     * `t3.small` (works with swap)
   * **Key Pair**: Create or select one (`.pem`)
   * **Storage**: Minimum **20 GB**

3. **Security Group (IMPORTANT)**
   Add inbound rules:

   | Type                                            | Port |
   | ----------------------------------------------- | ---- |
   | SSH                                             | 22   |
   | Custom TCP                                      | 8080 |
   | Custom TCP                                      | 9000 |
   | Custom TCP                                      | 9090 |
   | Custom TCP                                      | 3000 |
   | Source: `My IP` (or 0.0.0.0/0 for testing only) |      |

4. Launch instance

---

## 🔹 STEP 2: Connect to EC2 via SSH

```bash
chmod 400 your-key.pem

ssh -i your-key.pem ubuntu@EC2_PUBLIC_IP
```

---

## 🔹 STEP 3: Install Git (if not present)

```bash
sudo apt update -y
sudo apt install git -y
```

---

## 🔹 STEP 4: Upload Project to EC2

### Option A: Clone from GitHub (Recommended)

```bash
git clone https://github.com/your-username/devops-ec2-setup.git
cd devops-ec2-setup
```

### Option B: Upload from Local Machine

```bash
scp -i your-key.pem -r devops-ec2-setup ubuntu@EC2_PUBLIC_IP:/home/ubuntu/
cd devops-ec2-setup
```

---

## 🔹 STEP 5: Make Scripts Executable

```bash
chmod +x **/*.sh
```

---

## 🔹 STEP 6: Run the Full Setup

```bash
./run-all.sh
```

⏳ This takes **10–15 minutes** (Docker + Jenkins + SonarQube)

---

## 🔹 STEP 7: Reboot EC2 (Highly Recommended)

```bash
sudo reboot
```

Reconnect after reboot.

---

## 🔹 STEP 8: Verify Services

### Docker

```bash
docker --version
docker ps
```

### Jenkins

```bash
sudo systemctl status jenkins
```

Initial Admin Password:

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

## 🔹 STEP 9: Access Tools in Browser

Replace `EC2_PUBLIC_IP`:

| Tool       | URL                         |
| ---------- | --------------------------- |
| Jenkins    | `http://EC2_PUBLIC_IP:8080` |
| SonarQube  | `http://EC2_PUBLIC_IP:9000` |
| Prometheus | `http://EC2_PUBLIC_IP:9090` |
| Grafana    | `http://EC2_PUBLIC_IP:3000` |

---

## 🔹 STEP 10: First-Time Login Credentials

### Jenkins

* Password from:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

### SonarQube

```
username: admin
password: admin
```

### Grafana

```
username: admin
password: admin
```

---

## 🔹 Common Issues & Fixes

### ❌ Jenkins not opening?

```bash
sudo ufw disable
```

### ❌ SonarQube fails on small EC2?

```bash
free -h
sudo swapon --show
```

### ❌ Docker permission issue?

```bash
newgrp docker
```
