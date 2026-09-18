FROM python:3.11-slim

# 安装系统依赖
RUN apt-get update && apt-get install -y \
    gcc \
    curl \
    && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /app

# 复制依赖文件
COPY gateway/sida/requirements.txt .

# 安装 Python 依赖
RUN pip install --no-cache-dir -r requirements.txt

# 复制网关代码
COPY gateway/sida/eltdx-tq-gateway.py .
COPY gateway/sida/start-gateway.sh .
COPY gateway/sida/stop-gateway.sh .

# 创建日志目录
RUN mkdir -p /var/log/eltdx-gateway

# 暴露端口
EXPOSE 17709

# 设置环境变量
ENV PYTHONUNBUFFERED=1
ENV GATEWAY_PORT=17709
ENV GATEWAY_HOST=0.0.0.0

# 启动网关
CMD ["./start-gateway.sh"]
