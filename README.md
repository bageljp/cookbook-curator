What's ?
===============
chef で使用する curator の cookbook です。

Usage
-----
cookbook なので berkshelf で取ってきて使いましょう。

* Berksfile
```ruby
source "https://github.com/bageljp/"

cookbook "curator", git: "https://github.com/bageljp/cookbook-curator.git"
```

```
berks vendor
```

Recipes
----------

#### curator::default
curator をインストールしてcronの設定を行う。

Attributes
----------

主要なやつのみ。

#### curator::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>['curator']['cron']['user']</tt></td>
    <td>string</td>
    <td>curator の実行ユーザ。指定したユーザのcronに設定される。</td>
  </tr>
  <tr>
    <td><tt>['curator']['cron']['hour']</tt></td>
    <td>string</td>
    <td>curator を実行する時間。cronに設定される</td>
  </tr>
  <tr>
    <td><tt>['curator']['cron']['minute']</tt></td>
    <td>string</td>
    <td>curator を実行する分。cronに設定される</td>
  </tr>
  <tr>
    <td><tt>['curator']['days']['close']</tt></td>
    <td>string</td>
    <td>curator でクローズ対象にするインデックスの日数。クローズなので削除はまだされない。</td>
  </tr>
  <tr>
    <td><tt>['curator']['days']['delete']</tt></td>
    <td>string</td>
    <td>curator で削除対象にするインデックスの日数。</td>
  </tr>
  <tr>
    <td><tt>['curator']['es']['host']</tt></td>
    <td>string</td>
    <td>curator で削除対象にする ElasticSearch のIPアドレス。</td>
  </tr>
  <tr>
    <td><tt>['curator']['es']['ndex']</tt></td>
    <td>string</td>
    <td>curator で削除対象にする ElasticSearch のインデックス名。</td>
  </tr>
</table>

