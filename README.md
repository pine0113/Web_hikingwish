# <a href="https://hikingwish.tw"> 登山許願池</a> 

> 以 Rails 開發的登山揪團平台
> 可以讓使用者尋找、並加入已有的登山計畫
> 如果沒有計畫、可以先將想爬的條件、時間先列出來、等待符合的計畫開出來後被邀請或主動加入
> 登山計畫可以被金額、車行模式、收費模式等進行篩選
> 


[![網頁截圖](https://i.imgur.com/1Kmv7BL.png)]()


## User Story

1. (complete) 使用者可以瀏覽計畫並申請加入 
2. (complete) 計畫擁有者可以審核申請加入計畫的使用者
3. (in progress) 計畫擁有者可以針對有符合條件願望的使用者送出邀請
4. (complete) 使用者可以審核收到的計畫邀請
5. (complete) 在申請跟邀請畫面雙方可以聊天
6. (in progress) 計畫擁有者可以勾選計劃已完成準備項目
7. (complete) 計畫參與成員可以在計畫頁面聊天
8. (in progress) 使用者可以在計畫項目中觀看需要準備的項目
9. (in progress) 使用者可以許願後瀏覽符合心願的登山計畫
10. (complete) 使用者可以瀏覽既有路線直接加入心願 
11. (complete) 事件發生後系統會有通知訊息
12. (in progress) 事件發生後系統會有email 訊息

## 預計調整項目

1.許願方式 - 需有建議項目 (不然使用者會不知道要輸入什麼) (story 9)
2.符合項目的搜尋方式 (目前金額跟日期還沒有辦法 filter)(story 3,9)
3.信件寄送方式 (目前無法取得完成事件訊息) (story 12)
4.整體排版模式 以及 按鈕出現情境


## 目錄

- [安裝](#installation)
- [特色](#features)
- [Contributing](#contributing)
- [團隊介紹](#團隊)
- [FAQ](#faq)
- [Support](#support)
- [License](#license)

---

## Installation

此安裝教學以 Mac OS 為基準 (拍謝 因為沒有 Windows環境 XD)


### Setup

> 安裝 ruby & rails

```shell
$ brew install ruby
$ gem install rails
```

> 複製這份code

```shell
$ git clone https://github.com/pine0113/hikingwish
$ cd hikingwish
```

> bundle install

```shell
$ bundle install
```

> db 設定

```shell
$ rails db:migrate #必選

$ rails db:seed	  #以下為代入假資料...選用
$ rails dev:fake_wishes
$ rails dev:fake_plans

```


### 手動設定檔

> 以下幾個檔案因為有 production 環境故設定成 gitignore中
> 請自行手動建立

* /config/facebook.yml

```
development:
  app_id: 
  secret: 
  
product:
  app_id:
  secret:
```
* /config/email.yml

```
development:
  address: "smtp.mailgun.org"
  port: 587
  domain: "yourdomain.com"
  authentication: "plain"
  user_name: "postmaster@yourdomain.com"
  password: ""
  enable_starttls_auto: true
production:
  address: "smtp.mailgun.org"
  port: 587
  domain: "yourdomain.com"
  authentication: "plain"
  user_name: "postmaster@yourdomain.com"
  password: ""
  enable_starttls_auto: true
```

### 執行

```
	rails s
```

### 部署
> 請修改 
* /config/deploy.rb

```
`ssh-add`

# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "hiking_wish" #application name
set :repo_url, "git@github.com:pine0113/hikingwish.git" #the code repo you want to deploy

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
 set :deploy_to, "/home/deploy/hiking_wish" #the folder on server 

```

* /config/deploy/production.rb

```
 server '35.221.247.95', user: 'deploy', roles: %w{app db web}, my_property: :my_value
 
 ...
```

> 最後執行 deploy 即可

```shell 
$ cap production deploy

```
---

## Features

>
> 使用者可以許願
>
> 提供以facebook登入、紀錄登山願望、媒合登山計畫
> 
> 針對每一個行程提供登山檢查記錄表
> 


---

## Contributing

> 目前此專案尚在持續開發
> 
> 如果想加入團隊的話請跟 <a href="https://facebook.com/pine0113" target="_blank">**綠島聯繫**</a> 或是直接發 PR
> (但是 PR 很偶爾才會上來看一下 -_-b)
> 
---

## 團隊介紹

> 登山許願池 初始團隊
> 
> 這是從 AlphaCamp 大航道課程 Demo Day 2 中所建立的團隊

| <a href="https://github.com/pine0113" target="_blank">**綠島**</a> | <a href="https://github.com/pinkg023" target="_blank">**浪浪**</a> | <a href="https://github.com/DuncanYe" target="_blank">**DuncanYe**</a> |
| :---: |:---:| :---:|
| ![](https://avatars1.githubusercontent.com/u/4540530?s=200)   | ![](https://avatars2.githubusercontent.com/u/32866430?s=200) | ![](https://avatars0.githubusercontent.com/u/32873800?s=200) |
| <a href="http://github.com/pine0113" target="_blank">`github.com/pine0113`</a> | <a href="https://github.com/pinkg023" target="_blank">`github.com/pinkg023 `</a> | <a href="https://github.com/DuncanYe" target="_blank">`github.com/DuncanYe `</a> |


---

## FAQ


---

## Support

請從下方資訊與我們聯繫

- Facebook <a href="https://www.facebook.com/pine0113" target="_blank">`綠島`</a>

---

## License

還沒想要放什麼license