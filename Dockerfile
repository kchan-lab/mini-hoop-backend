# Ruby公式の指定バージョン
FROM ruby:3.4.7

# 基本ツール & PostgreSQLクライアント
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    build-essential libpq-dev postgresql-client curl ca-certificates tzdata \
 && rm -rf /var/lib/apt/lists/*

ENV TZ=Asia/Tokyo
WORKDIR /app

# 依存インストール（Gemfileが無い場合は後述の初期化手順で作成）
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install
RUN gem install rails -v 8.1 -N

# アプリ本体
COPY . .

EXPOSE 3000
CMD ["bash", "-lc", "bundle exec rails s -b 0.0.0.0 -p 3000"]
