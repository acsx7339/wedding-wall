#!/bin/bash

set -e

echo "🎊 WeddingShare 啟動中..."

# 顏色定義
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;36m'
NC='\033[0m' # No Color

# 檢查 Docker
if ! command -v docker &> /dev/null; then
    echo -e "${RED}❌ Docker 未安裝，請先安裝 Docker${NC}"
    exit 1
fi

if ! docker info > /dev/null 2>&1; then
    echo -e "${RED}❌ Docker 未運行，請啟動 Docker${NC}"
    exit 1
fi

# 檢查 docker-compose
if command -v docker-compose &> /dev/null; then
    COMPOSE_CMD="docker-compose"
elif docker compose version > /dev/null 2>&1; then
    COMPOSE_CMD="docker compose"
else
    echo -e "${RED}❌ docker-compose 未安裝${NC}"
    exit 1
fi

echo -e "${BLUE}使用 Docker Compose 命令: $COMPOSE_CMD${NC}"

# 建立必要目錄
echo "📁 建立資料目錄..."
mkdir -p data/uploads data/config data/thumbnails cloudflared scripts

# 檢查 .env 檔案
if [ ! -f .env ]; then
    echo -e "${YELLOW}⚠️  未找到 .env 檔案，複製範本...${NC}"
    cp .env.example .env
    echo -e "${YELLOW}⚠️  請編輯 .env 檔案並更改預設密碼${NC}"
    echo ""
    read -p "是否現在編輯 .env 檔案? (y/N): " edit_env
    if [[ $edit_env =~ ^[Yy]$ ]]; then
        ${EDITOR:-nano} .env
    fi
fi

# 詢問是否使用 Cloudflare Tunnel
echo ""
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo -e "${BLUE}   Cloudflare Tunnel 設定${NC}"
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo ""
echo "100 位賓客使用手機網路，建議啟用 Cloudflare Tunnel"
echo ""
read -p "是否啟用 Cloudflare Tunnel? (Y/n): " use_tunnel

if [[ ! $use_tunnel =~ ^[Nn]$ ]]; then
    # 檢查配置檔是否存在
    if [ ! -f cloudflared/config.yml ]; then
        echo -e "${YELLOW}⚠️  未找到 Cloudflare Tunnel 配置${NC}"
        echo ""
        echo "請先完成以下步驟："
        echo "1. cloudflared tunnel login"
        echo "2. cloudflared tunnel create wedding-share"
        echo "3. 複製 credentials.json 到 cloudflared/ 目錄"
        echo "4. 編輯 cloudflared/config.yml"
        echo ""
        echo "詳細步驟請參考: cloudflare_tunnel_guide.md"
        echo ""
        read -p "配置完成後按 Enter 繼續，或按 Ctrl+C 取消..."
    fi
    
    # 確認 credentials.json 存在
    if ! ls cloudflared/*.json > /dev/null 2>&1; then
        echo -e "${RED}❌ 未找到 Tunnel credentials.json 檔案${NC}"
        echo "請將 Tunnel credentials 複製到 cloudflared/ 目錄"
        exit 1
    fi
    
    COMPOSE_PROFILE=""
else
    # 停用 cloudflared
    echo -e "${YELLOW}ℹ️  僅啟動 WeddingShare，不使用 Cloudflare Tunnel${NC}"
    COMPOSE_PROFILE="--profile disabled"
fi

# 建置並啟動
echo ""
echo -e "${GREEN}🔨 建置 Docker 映像檔...${NC}"
$COMPOSE_CMD build

echo ""
echo -e "${GREEN}🚀 啟動服務...${NC}"
$COMPOSE_CMD up -d $COMPOSE_PROFILE

# 等待服務啟動
echo ""
echo -e "${BLUE}⏳ 等待服務啟動...${NC}"
sleep 5

# 檢查服務狀態
if $COMPOSE_CMD ps | grep -q "wedding-share-app.*Up"; then
    echo ""
    echo -e "${GREEN}═══════════════════════════════════════${NC}"
    echo -e "${GREEN}✅ WeddingShare 已成功啟動！${NC}"
    echo -e "${GREEN}═══════════════════════════════════════${NC}"
    echo ""
    echo -e "📱 ${BLUE}本機訪問:${NC} http://localhost:5000"
    
    if [[ ! $use_tunnel =~ ^[Nn]$ ]]; then
        TUNNEL_DOMAIN=$(grep "hostname:" cloudflared/config.yml 2>/dev/null | head -1 | awk '{print $3}')
        if [ ! -z "$TUNNEL_DOMAIN" ]; then
            echo -e "🌐 ${BLUE}外網訪問:${NC} https://$TUNNEL_DOMAIN"
        fi
    fi
    
    echo ""
    echo -e "${YELLOW}🔐 管理員資訊:${NC}"
    echo "   帳號: admin"
    echo "   密碼: 請查看 .env 檔案的 ADMIN_PASSWORD"
    echo ""
    echo -e "${BLUE}📋 常用指令:${NC}"
    echo "   查看日誌: $COMPOSE_CMD logs -f"
    echo "   停止服務: $COMPOSE_CMD down"
    echo "   重啟服務: $COMPOSE_CMD restart"
    echo ""
    echo -e "${GREEN}🎉 準備工作完成！請前往管理後台建立相簿並取得 QR Code${NC}"
else
    echo ""
    echo -e "${RED}❌ 服務啟動失敗，請查看日誌${NC}"
    $COMPOSE_CMD logs
    exit 1
fi
