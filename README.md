# nablarch-example-workflow

| master | develop |
|:-----------|:------------|
|[![Build Status](https://travis-ci.org/nablarch/nablarch-example-workflow.svg?branch=master)](https://travis-ci.org/nablarch/nablarch-example-workflow)|[![Build Status](https://travis-ci.org/nablarch/nablarch-example-workflow.svg?branch=develop)](https://travis-ci.org/nablarch/nablarch-example-workflow)|

# ディレクトリについての補足

| ディレクトリ               | 補足                                                                                                                                                                             |
|:---------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|db/data/                    |DBに疎通確認用データを格納するためのSQL文。                                                                                                                                       |
|db/ddl/                     |Nablarchで使用するテーブルを作成するためのDDL。テーブルを作り直すときに使用するDROP文も用意している。                                                                             |
|h2/bin/                     |H2 Database Engine(以下H2)に格納されているデータを確認するためのツールが格納されている(本プロジェクトは初期状態でH2を使用する構成になっている)。                                  |
|h2/db/                      |H2のデータファイルが格納されているディレクトリ。H2のデータが壊れた際は、「SAMPLE.mv.db」を削除し、「SAMPLE.mv.db.org」を、「SAMPLE.mv.db」という名前でコピーすることで復旧できる。|
|src/env/dev/resources/      |開発環境用の設定ファイルを格納するディレクトリ                                                                                                                                    |
|src/env/dev/webapp/WEB-INF/ |開発環境用のweb.xmlを格納するディレクトリ                                                                                                                                         |
|src/env/prod/resources/     |本番環境用の設定ファイルを格納するディレクトリ                                                                                                                                    |
|src/main/resources/         |開発環境、本番環境、共に使用する設定ファイルを格納するディレクトリ                                                                                                                |
|src/test/resources/         |自動テスト(ユニットテスト)用の設定ファイルを格納するディレクトリ                                                                                                                  |
|tools/                      |mavenと連携して動作させるツールの設定を格納するディレクトリ                                                                                                                       |

# H2に格納されているデータを確認する方法

以下の手順で確認する。

1.「mvn waitt:run」でアプリを起動している場合は終了させる。

2.h2/bin/h2.batを実行する。

3.しばらく待つとブラウザが起動するので、各項目に以下の通りに入力し、[Connect]ボタンをクリックする。

| 項目     | 値                  |
|:---------|:--------------------|
|JDBC URL  |jdbc:h2:../db/SAMPLE |
|User Name |SAMPLE               |
|Password  |SAMPLE               |

4.左側のペインのテーブル名をクリックすると、クリックしたテーブルに対するSELECT文が生成される。

5.[Run]ボタンをクリックすると、生成したSELECT文が実行され、テーブルのデータを確認することができる。

6.使用終了時は、左上のdisconnectボタン(赤色で書かれたアイコンのボタン)をクリックして切断する。
  **切断を忘れると、WebアプリからH2に接続できなくなる。**


