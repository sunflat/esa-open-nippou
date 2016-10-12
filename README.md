# esa-open-nippou
OSXのためのesa.ioで特定の日の日報を全部開くスクリプト

## インストール

```
$ bundle install
$ mv .env.default .env # APIキーとチーム名を設定
```

## 使い方

今日が2016/10/12なら`in:日報/2016/10/12 `で検索してヒットしたPostを全てブラウザで開きます。

```
$ bundle exec ruby main.rb
```

引数に何日前のものを取りたいか指定できます
例えば2日前の日報を開きたい時

```
$ bundle exec ruby main.rb 2
```

