# BroH_GW2 iOS App 說明
為了 GW2 所做的 iOS App

### BroH_GW2 功能說明：
包含五個 Tab Bar 功能：
- 世界王時間
- 拍賣場 & Gem 換金查詢
- 副本
- 公會相關
- 其他

### 官方 GW2 Api 網站

- https://wiki.guildwars2.com/wiki/API:Main

### 第三方 framework

- AFNetworking
- JSONModel

### 安裝方式

- 請先確認是否有安裝 cocoaPods
- 下載後，請打開有 podfile 的資料夾，並且在此資料夾路徑下，輸入 pod update 來安裝第三方 framework
- WebSiteHelper 是用來跟 GW2 網站發起 webApi request 的工具，詳細請看 GitHub 中的 GW2_WebSite 測試專案。
