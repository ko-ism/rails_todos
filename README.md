# rails_todos

> 2019/12/11-2019/12/13
Ruby on railsのテスト備忘録

## todo1アプリ
まずはToDOアプリを簡易動作させた

### 環境
- Windows10(WSL Ubuntu18.04)
- Ruby
  - ruby 2.6.4p104 (2019-08-28 revision 67798) [x86_64-linux]
- Rails
  - Rails 6.0.1
- MySQL
  - mysql  Ver 14.14 Distrib 5.7.28, for Linux (x86_64) using  EditLine wrapper
  - 参考：[WSLのUbuntu18.04.1LTSにMySQL5.7を入れたお話](https://qiita.com/nyu___nS/items/1ee02999d2032d81b498)
  - 参考：[MySQL 5.7 をインストールしたら最初に行うセットアップ](https://weblabo.oscasierra.net/mysql-57-init-setup/)

### 実施内容
+ rails new todo1 -d mysql
+ mysqlを動作させておくことで試験可能

+ ScaffoldでUser/Taskを作成
+ User/TaskはValidates
  app/models/user.rbにValidates設定
  app/models/task.rbにValidates設定
+ アソシエーション設定実施
  task.rbにてbelongs_to :user
  user.rbにてhas_many :tasks, :dependent => :destroy
  それに伴い色々修正
+ セッション情報を持たせるSessionコントローラの作成
  rails generate controller Sessions new
+ ログイン中ユーザ情報を表示させるヘルパーメソッド導入
  helper_method:current_user

### Tips
+ View側で```<%= debug(params) %>```記載すると、POSTなどで渡された値を可視化できる。Formで渡す際は、name keyが表示される。
+ form_for のViewに渡される変数がUser.newなどの新規の場合は、Submitするとcreateが呼び出され、User.firstなど既存の場合はUpdateが呼び出される
+ form_for/form_tagは非推奨で、Rails6以降はform_withを使う
+ 表示の動作がうまくいかないときは、View側は```<%= 変数名 %>```などで見るか、ruby側は途中で処理を割り込んでrenderさせる手法で切り分けるとよい、

```Ruby:xxx.rb
render :plain => user.inspect
return
```
