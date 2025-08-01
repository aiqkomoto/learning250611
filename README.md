# ローカル環境構築手順

## インストール必要項目

- Ruby ver.3.3.8  
- Rails ver.8.0.2  
- Git  

## セットアップ手順

```bash
git clone https://github.com/aiqkomoto/learning250611.git
cd learning250611
bundle install
rails db:setup
rails db:migrate
rails db:migrate RAILS_ENV=test  # RSpecテスト用マイグレーション
rails c
    User.create!(name: "test", email: "test@email.com")  # ユーザーデータ準備
    exit
rails s
```

## ブラウザでアクセス

http://localhost:3000/