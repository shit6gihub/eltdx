# eltdx-TQ Gateway - SIDA 适配器

基于 eltdx 的通达信行情网关，为 SIDA v0.4.38 提供 TQ 兼容接口。

## 功能

- TQ 兼容接口：适配 SIDA v0.4.38 TQ vendor
- eltdx 原生接口：支持全部 126 个公开方法
- Docker 镜像：自动构建和部署

## 目录结构

```
gateway/sida/
├── eltdx-tq-gateway.py  # 网关主程序
├── requirements.txt     # Python 依赖
├── start-gateway.sh     # 启动脚本
├── stop-gateway.sh      # 停止脚本
└── Dockerfile           # 镜像构建文件
```

## 使用方法

### Docker 运行

```bash
docker run -d \
  --name eltdx-tq-gateway \
  -p 17709:17709 \
  --restart unless-stopped \
  ghcr.io/shit6gihub/eltdx gateway:sida
```

### SIDA 配置

在 SIDA 的 `docker-compose.yml` 中添加环境变量：

```yaml
environment:
  - PANWATCH_ENABLE_TQ=1
  - TDX_QUANT_URL=http://host.docker.internal:17709
```

## API 端点

| 端点 | 说明 |
|------|------|
| `POST /` | TQ 兼容接口 |
| `POST /jsonrpc` | TQ JSON-RPC 接口 |
| `POST /rpc` | eltdx 原生 RPC 接口 |
| `GET /health` | 健康检查 |
| `GET /methods` | 方法列表 |

## GitHub Actions

当推送代码到 main 分支时，自动构建 Docker 镜像并推送到 GitHub Container Registry。

手动触发构建：https://github.com/shit6gihub/eltdx/actions
