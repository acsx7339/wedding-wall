# WeddingShare

<br />![Banner](banner.png)

## ✨ 新增功能 (New Features)

### 彈幕系統 (Danmaku / Bullet Screen)
讓賓客參與感倍增！賓客可以在手機端發送祝福語，訊息會即時以彈幕形式飄過投影的輪播畫面。
- **即時互動**：使用 SignalR 技術。
- **離線支援**：內建 SignalR Library，無需外網即可在 Localhost 完美運行。
- **自動隱藏**：投影端自動隱藏輸入框，保持畫面簡潔。

## 🚀 Docker 快速開始 (Quick Start)

無需繁瑣設定，使用 Docker 即可快速部署：

```bash
# 1. 建置 Image
docker build -f WeddingShare/Dockerfile -t wedding-share .

# 2. 啟動 Container (Port 5000)
docker run -d -p 5000:8080 --name wedding-share-app wedding-share
```

瀏覽器打開 `http://localhost:5000` 即可開始使用！

## 支持 (Support)

感謝所有支持這個專案的人。如果你還沒有支持，如果你能透過下面的連結「請我喝杯咖啡」，我將感激不盡。婚禮很貴，這個專案的所有收益都將用來支付我的婚禮費用。

- BuyMeACoffee - https://buymeacoffee.com/cirx08
- GitHub Sponsors - https://github.com/sponsors/Cirx08

## 關於 (About)

WeddingShare 是一個只有單一目標的基礎網站。它提供你和你的賓客一種分享大日子的回憶以及籌備過程的方式。只需透過網址提供賓客相簿連結，更好的方式是印出提供的 QR code 並放在賓客的餐桌上。這樣做可以讓他們查看你到目前為止的旅程，例如試穿禮服/西裝、參觀場地、試菜或挑選蛋糕等。

你不受限於單一相簿。你可以產生多個相簿，每個都有自己的分享連結。目前階段，相簿安全性稍微不足，這意味著任何擁有連結的人都可以查看和分享照片，所以我建議將分享連結保密。為了防止陌生人存取你的相簿，你可以在設定時提供一個密鑰 (secret key)，但請注意，這只是一種嚇阻手段，讓猜測網址稍微變難，並不是真正的全面安全措施。

## 免責聲明 (Disclaimer)

警告。這是開源軟體 (GPL-V3)，雖然我們盡最大努力確保版本穩定且無錯誤，但不提供任何保證。使用風險自負。

## 演示 (Demo)
先試試看 - https://demo.wedding-share.org/

## 注意事項 (Notes)

並非所有圖片格式都受瀏覽器支援，所以雖然你可以透過 ALLOWED_FILE_TYPES 環境變數新增它們，但它們可能不被支援。其中一種格式是 Apple 的 .heic 格式。這是 Apple 裝置專用的，由於其授權問題，許多瀏覽器尚未實作支援。

## 文件與設定 (Documentation & Setup)
有關設定步驟與完整可設定選項列表，請參閱文件網站 - https://docs.wedding-share.org。

## 連結 (Links)
- 文件 - https://docs.wedding-share.org
- GitHub - https://github.com/acsx7339/wedding-wall
- DockerHub - https://hub.docker.com/r/cirx08/wedding_share
- BuyMeACoffee - https://buymeacoffee.com/cirx08
- GitHub Sponsors - https://github.com/sponsors/Cirx08

## 截圖 (Screenshots)

### 桌面版 (Desktop)

![Homepage](screenshots/Homepage.png)

![Gallery](screenshots/Gallery.png)

![Gallery](screenshots/Gallery-FullWidth.png)

![Gallery](screenshots/Gallery-Presentation.png)

![Gallery](screenshots/Gallery-Slideshow.png)

![Admin Area](screenshots/Admin.png)

### 行動版 (Mobile)

![Homepage](screenshots/Homepage-Mobile.png)

![Gallery](screenshots/Gallery-Mobile.png)

![Admin Area](screenshots/Admin-Mobile.png)

### 深色模式 (Dark Mode)

![Homepage](screenshots/Homepage-Dark.png)

![Gallery](screenshots/Gallery-Dark.png)

![Gallery](screenshots/Gallery-FullWidth-Dark.png)

![Gallery](screenshots/Gallery-Presentation-Dark.png)

![Gallery](screenshots/Gallery-Slideshow-Dark.png)

![Admin Area](screenshots/Admin-Dark.png)

![Homepage](screenshots/Homepage-Mobile-Dark.png)

![Gallery](screenshots/Gallery-Mobile-Dark.png)

![Admin Area](screenshots/Admin-Mobile-Dark.png)