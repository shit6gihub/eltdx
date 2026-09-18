#!/bin/bash
# eltdx-TQ Gateway 停止脚本

PID_FILE="/tmp/eltdx-tq-gateway.pid"
LOG_FILE="/tmp/eltdx-tq-gateway.log"

if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    if kill -0 "$PID" 2>/dev/null; then
        kill "$PID"
        echo "Gateway stopped (PID: $PID)"
    else
        echo "Gateway not running"
    fi
    rm -f "$PID_FILE"
else
    echo "No PID file found"
fi

# 清理日志
if [ -f "$LOG_FILE" ]; then
    echo "Log size: $(du -sh "$LOG_FILE" | cut -f1)"
fi
