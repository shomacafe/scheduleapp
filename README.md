# INASAKU

INASAKU のバックエンド実装

## 環境構築手順

### 必須ツール

- Docker
- docker-compose

### クローンする

git cloneして作業ディレクトリまで移動します。
```
$ git clone https://gitlab.inn-farm.jp/tonosama/inasaku-project.git
$ cd inasaku-project/source/inasaku
```

### docker立ち上げ

作業ディレクトリで以下を実行して、コンテナをビルドして開始します。
```
$ docker-compose build
$ docker-compose up
```

### webコンテナ内のbashシェルにアクセス

以下のコマンドを実行して、Web コンテナの bash シェルにアクセスします。
```
$ docker-compose exec web bash
```


### データベースの作成

bash シェルにアクセスしたら、以下のコマンドを実行してデータベースを作成します。
```
$ rails db:create
$ rails db:migrate
```
