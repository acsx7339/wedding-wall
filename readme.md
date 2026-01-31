# WeddingShare - 婚禮互動照片牆 & 彈幕系統

<br />![Banner](banner.png)

WeddingShare 是一個專為婚禮設計的互動與照片分享平台。不僅讓賓客可以輕鬆上傳婚禮現場的照片，還新增了即時彈幕功能，讓大家的祝福直接飄過大螢幕！

## ✨ 主要功能 (Features)

- **🖼️ 即時照片輪播 (Live Slideshow)**: 賓客上傳的照片會自動加入輪播列表，即時顯示在投影幕上。
- **💬 彈幕互動系統 (Danmaku)**: 賓客可以在手機端發送祝福文字，訊息會以彈幕形式即時飛過投影畫面，炒熱現場氣氛。
- **📱 響應式設計 (Mobile Friendly)**: 賓客無需下載 App，掃描 QR Code 即可透過瀏覽器使用完整功能。
- **🔒 私密相簿**: 支援多個獨立相簿，可設定密鑰 (Secret Key) 保護。
- **🐳 Docker 快速部署**: 簡單幾行指令即可在任何支援 Docker 的電腦上架設。

---

## 🤵👰 新人使用指南 (Host Guide)

作為婚禮的主辦方，你需要準備一台電腦連接投影機，並運行此系統。

### 第一步：啟動系統
使用 Docker 快速啟動伺服器 (詳細指令請見下方「快速開始」)。
啟動後，使用瀏覽器打開 `http://localhost:5000`。

### 第二步：建立相簿
1. 點擊首頁的「Create Gallery」(建立相簿)。
2. 輸入相簿名稱 (例如: `Wedding2026`)。
3. (選填) 設定一組 Secret Key 作為管理密碼。
4. 建立後，你會進入相簿管理介面。

### 第三步：現場投影設定
1. 在管理介面中，找到 **"Slideshow" (輪播模式)**。
2. 點擊進入後，瀏覽器會全螢幕播放照片輪播。
3. 將此畫面投影到婚禮現場的大螢幕上。
4. 畫面中會自動輪播 QR Code 頁面，引導賓客加入。

---

## 🥂 賓客使用情景 (Guest Scenario)

賓客不需要複雜的操作，只要有手機就能參與互動。

### 情境一：分享感動瞬間 📸
1. **掃描 QR Code**: 掃描大螢幕或桌卡上的 QR Code。
2. **上傳照片**: 點擊「上傳照片」按鈕，選擇剛拍好的婚禮美照。
3. **即時分享**: 上傳成功後，照片會自動排程，稍後就會出現在大螢幕的輪播中！

### 情境二：發送彈幕祝福 💬
1. **輸入祝福**: 在手機網頁下方找到輸入框。
2. **發送**: 打上「新婚快樂！！」或是「新郎好帥！」，按下發送。
3. **驚喜效果**: 抬頭看大螢幕，你的祝福會以彈幕動畫飛過畫面，全場都看得到！

---

## 🚀 Docker 快速開始 (Quick Start)

無需繁瑣環境設定，使用 Docker 即可一鍵部署：

```bash
# 1. 建置 Image
docker build -f WeddingShare/Dockerfile -t wedding-share .

# 2. 啟動 Container (Port 5000)
docker run -d -p 5000:8080 --name wedding-share-app wedding-share
```

啟動後，瀏覽器打開 `http://localhost:5000` 即可開始使用。

---

## 關於 (About)

WeddingShare 的初衷是提供一種簡單、私有的方式來收集婚禮照片。雖然市面上有許多類似服務，但我們希望提供一個開源、可自架且無廣告的替代方案。

特別感謝所有支持這個專案的人。如果你喜歡這個專案，歡迎透過以下方式支持我們，所有收益將用於支付開發者的婚禮費用 (是真的！)。

- BuyMeACoffee - https://buymeacoffee.com/cirx08
- GitHub Sponsors - https://github.com/sponsors/Cirx08

## 連結 (Links)
- 文件 - https://docs.wedding-share.org
- GitHub - https://github.com/acsx7339/wedding-wall
- DockerHub - https://hub.docker.com/r/cirx08/wedding_share

---

## 截圖 (Screenshots)

### 桌面版 (Desktop)

![Homepage](screenshots/Homepage.png)
*首頁*

![Gallery-Slideshow](screenshots/Gallery-Slideshow.png)
*輪播模式 (包含 QR Code)*

![Gallery-Presentation](screenshots/Gallery-Presentation.png)
*展示模式*

![Admin Area](screenshots/Admin.png)
*後台管理*

### 行動版 (Mobile)

<div style="display: flex; gap: 10px;">
  <img src="screenshots/Homepage-Mobile.png" width="30%" alt="Mobile Home" />
  <img src="screenshots/Gallery-Mobile.png" width="30%" alt="Mobile Gallery" />
</div>

### 深色模式 (Dark Mode)

![Gallery-Slideshow-Dark](screenshots/Gallery-Slideshow-Dark.png)