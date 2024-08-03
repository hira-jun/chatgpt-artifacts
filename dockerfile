# ベースイメージとしてNode.jsを使用
FROM node:18

# 作業ディレクトリを設定
WORKDIR /app

# パッケージマネージャのキャッシュを利用するためにpackage.jsonとpackage-lock.jsonをコピー
COPY package*.json ./

# 依存関係をインストール
RUN npm install

# アプリケーションのソースコードをコピー
COPY . .

# 環境変数ファイルをコピー
COPY .env.example .env

# アプリケーションをビルド
RUN npm run build

# アプリケーションを実行
CMD ["npm", "start"]