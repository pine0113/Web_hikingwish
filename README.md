# <a href="https://hikingwish.tw"> 登山許願池</a> 

> 以 Rails 開發的登山揪團平台
> 


[![網頁截圖](https://i.imgur.com/1Kmv7BL.png)]()


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

| <a href="https://github.com/pine0113" target="_blank">**綠島**</a> | <a href="https://github.com/pinkg023" target="_blank">**浪浪**</a> | <a href="https://github.com/DuncanYe" target="_blank">**FVCproductions**</a> |
| :---: |:---:| :---:|
| ![FVCproductions](https://avatars1.githubusercontent.com/u/4540530?s=200)   | ![FVCproductions](https://avatars2.githubusercontent.com/u/32866430?s=200) | ![FVCproductions](https://avatars0.githubusercontent.com/u/32873800?s=200) |
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