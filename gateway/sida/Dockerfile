FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    gcc \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY eltdx-tq-gateway.py .

EXPOSE 17709

ENV PYTHONUNBUFFERED=1
ENV GATEWAY_PORT=17709
ENV GATEWAY_HOST=0.0.0.0

# TDX 行情服务器（公网免费服务器）
ENV TDX_HOST=114.142.142.124
ENV TDX_PORT=7709

CMD ["sh", "-c", "TDX_HOST=${TDX_HOST:-114.142.142.124} TDX_PORT=${TDX_PORT:-7709} python3 eltdx-tq-gateway.py"]