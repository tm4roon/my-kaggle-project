# My Kaggle Project

Kaggle用開発環境や実験管理リポジトリをコマンド一つで構築できる、プロジェクト雛形。


## 想定動作環境
以下の設定内容のGCEインスタンスで動作確認を行いました。

|  | 設定内容 |
|:--------:|:---------:|
| マシンタイプ | n1-highmem-4 |
| GPU | 1 x NVIDIA T4 | 
| ブートディスク | Ubuntu ([ubuntu-2004-focal-v20240209](https://console.cloud.google.com/compute/imagesDetail/projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20240209?project=kaggle-414007)) | 
| ディスクサイズ | 100GB |


## 利用方法

### 1. インスタンスにKaggle用開発環境を構築
以下の手順で、PythonやDocker, CUDA等を一括でインストールします。
```bash
git clone https://github.com/tm4roon/my-kaggle-project.git 
source ./my-kaggle-project/setup.sh
```

### 2. プロジェクト雛形からコンペ用実験ディレクトリの作成
```bash
cookiecutter my-kaggle-project
```

例えば、[Titanic - Machine Learning from Disaster](https://www.kaggle.com/competitions/titanic)の実験リポジトリを作る際には以下のように、`competition_name`に`titanic`を指定します。`competition_name`は、[Kaggle API](https://www.kaggle.com/docs/api)のパラメータ`[COMPETITION]`に対応しておりますので、参加するコンペ名に対応する値を入力していただければと思います。その他の値は任意に設定していただいて問題ありません。

<p align="center">
<img width=500 src=/images/example_cookiecutter_setup.png>
</p>
