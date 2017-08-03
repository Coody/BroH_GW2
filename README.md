# BroH_GW2 iOS App
![建立者](https://img.shields.io/badge/建立者-Coody-orange.svg)

### 專案目標：
為了 GW2 所做的 iOS App

### 此 App 的功能說明：
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
- GW2_iOS_WebApi
- GDataXML

### 安裝方式

- 請先確認是否有安裝 cocoaPods
- 下載後，請打開有 podfile 的資料夾，並且在此資料夾路徑下，輸入 ```pod update``` 來安裝第三方 framework
- WebSiteHelper 是用來跟 GW2 網站發起 webApi request 的工具，詳細請看 GitHub 中的 [GW2_iOS_WebApi][] 測試專案，這裡只要下```git submodule init``` 然後再下 ```git submodule update``` 即可。
- 用 xcode 打開 cocoapods 所產生的 ```GW2BroH.xcworkspace``` 即可 build and run ， enjoy it.

[GW2_iOS_WebApi]: https://github.com/Coody/GW2_iOS_WebApi
