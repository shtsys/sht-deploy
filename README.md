# SHT 账号管理系统

一站式论坛账号管理解决方案，支持1024/98自动签到、回帖、评分（点赞）等功能。

## 🚀 快速部署

### 1. 创建部署目录

```bash
mkdir sht-deploy && cd sht-deploy
```

### 2. 下载配置文件

```bash
# 下载 docker-compose.yml
curl -O https://raw.githubusercontent.com/shtsys/sht-deploy/main/docker-compose.yml

# 下载环境变量模板
curl -O https://raw.githubusercontent.com/shtsys/sht-deploy/main/.env.example
```

### 3. 配置环境变量

```bash
cp .env.example .env
# 编辑 .env 文件，设置 MYSQL_PASSWORD 和 REDIS_PASSWORD
```

### 4. 启动服务

```bash
docker compose up -d
```

### 5. 访问系统

- **Web 界面**: http://服务器 IP:8091
- **默认账号**: admin / superAdmin

> ⚠️ 首次登录后请立即修改默认密码！

## 📦 镜像说明

| 镜像             | 说明                          |
| ---------------- | ----------------------------- |
| `shtsys/sht-api` | 后端 API 服务 (Python/Django) |
| `shtsys/sht-web` | 前端 Web 界面 (Vue/Nginx)     |

## 🔧 环境变量

| 变量             | 必填 | 默认值        | 说明       |
| ---------------- | ---- | ------------- | ---------- |
| `MYSQL_PASSWORD` | ✅   | -             | MySQL 密码 |
| `REDIS_PASSWORD` | ✅   | -             | Redis 密码 |
| `WEB_PORT`       | ❌   | 8080          | Web 端口   |
| `API_PORT`       | ❌   | 8090          | API 端口   |
| `TZ`             | ❌   | Asia/Shanghai | 时区       |

## 📋 系统要求

- Docker 20.10+
- Docker Compose V2
- 1GB+ 内存

## 🔄 更新升级

```bash
docker compose pull
docker compose up -d
```

