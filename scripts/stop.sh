#!/bin/bash

echo "🛑 停止 WeddingShare 服務..."

# 檢查 docker-compose
if command -v docker-compose &> /dev/null; then
    COMPOSE_CMD="docker-compose"
elif docker compose version > /dev/null 2>&1; then
    COMPOSE_CMD="docker compose"
else
    echo "❌ docker-compose 未安裝"
    exit 1
fi

# 停止服務
$COMPOSE_CMD down

echo "✅ 服務已停止"
echo ""
echo "💡 提示："
echo "   - 資料已保留在 data/ 目錄"
echo "   - 如需重啟: ./scripts/start.sh"
echo "   - 如需完全清除: $COMPOSE_CMD down -v"
