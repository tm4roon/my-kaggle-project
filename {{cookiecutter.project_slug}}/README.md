# {{cookiecutter.project_name}}

[{{cookiecutter.competition_name}}]({{ "https://www.kaggle.com/competitions/" + cookiecutter.competition_name }})の実験コードを管理するリポジトリ。

## 使い方

### 1. データのダウンロード
以下のコマンドを実行してコンペティションのデータをダウンロードします。
```bash
make download
```

### 2. Notebookコンテナの起動
以下のコマンドを実行してコンテナを起動し、[http://127.0.0.1:8888/](http://127.0.0.1:8888/)にアクセスするとNotebookを確認できます。
```bash
make up
```

Permisson deniedと表示される場合は以下のいずれかを試してください。
- ルート権限で実行する
    ```bash
    sudo make up
    ```
- インスタンスの再起動ののち、再実行
    ```bash
    sudo reboot # インスタンスの再起動
    make up
    ```

### 3. Notebookコンテナの停止
以下のコマンドを実行してコンテナを停止します。
```bash
make down
```
