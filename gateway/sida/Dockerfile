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

CMD ["python3", "eltdx-tq-gateway.py"]
