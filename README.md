# README
アプリ名: AppSTORY

概要: 物語を作ったり、読んだり、シェアしたりできるアプリ

URL:

テスト用アカウント: Email -> sample@sample.com  
										password -> sample3

利用方法: ログインして物語を作り、それを他の人に読んでもらいシェアしたりコメントをもらえる。
ただ作るだけでは面白くないので、ランダムに表示されるお題をジャンルにそった物語で作ってもらう。
ログインしていなくとも読むことはできる。

目指した課題解決： 一度、自分の物語を作って見たい人。作った物で人を楽しませたい人や言語化するのが苦手な人が腕試しできる所。
また、読むのが好きで色々な物語に出会って見たいと思っている人や本を読むには時間が取れなくて諦めてしまっている人。
一作品、最大２８，８００字なので２０〜３０分で読める。
自分の作ったものが、人を楽しませたりそれを通じて繋がったりできる喜びを持ったアプリです。

洗い出した要件: 
| 機能          | 目的                               | 詳細                                | ストーリー(ユースケース)                                      | 見積もり（所要時間） |
| ----------- | -------------------------------- | --------------------------------- | -------------------------------------------------- | ---------- |
| テーブル設計      | どんなDBを使い制作していくかを決める              | データベースを決めて、ER図を書く                 | ER図を書く                                             | 10時間       |
| 物語の制作、投稿    | 色んな人に見てもらい、面白かったらシェアしてもらう        | フォームに書いてデータベースに登録                 | フォームに記入して送信                                        | 15時間       |
| 物語の一覧表示     | どんな話があるか表示する                     | トップページに最新の物や評価が高い物を表示する           | indexアクションを使ってページを作成                               | 15時間       |
| 物語の詳細       | 話を読んで楽しむ                         | 読みたい話をクリックして詳細ページに飛ぶ              | showアクションを使ってページの作成                                | 15時間       |
| 物語の編集       | より良い物を作る                         | 話を編集して更新                          | edit,updateを使い編集、更新ができる様にする                        | 10時間       |
| 物語の削除       | 上手く作れなかったり、納得行かない時のための削除機能       | 話を消す                              | destroyアクションを使い削除                                  | 3時間        |
| マイページの実装    | 自分の作品を振り返る場所                     | user_id でその人のページに飛ぶ               | usersコントローラーを作りview/showでマイページにとぶ                  | 10時間       |
| ログイン機能実装    | ログイン・ログアウトを使い外部から編集・削除を行われない様にする | devise を投入する                      | gem の deviseをインストールする                              | 10時間       |
| カテゴリー検索     | 読みたいカテゴリーの話を探せる                  | カテゴリー検索をトップページから行える様にする           | category コントローラーを作りview でそのカテゴリーが表示されるページをshow で作成 | 10時間       |
| お気に入りボタンの実装 | イイ話だと思ったらお気に入りにして、他の人に知らせる       | お気に入りボタンを作り、クリックする事で数字をカウントさせ表示する | likeテーブルを作りstoryとuserをつなげる                         | 10時間       |

実装した機能: 
	コメント機能： 読んだ人から感想をもらえる
	お気に入り機能： 気に入ってもらえればボタンを押してもらい、その数が多ければより皆に見てもらえる。
	https://gyazo.com/41a672898b7fcecce3f98780a8a6009b
	https://gyazo.com/cdf8370eced6d2a1dc7eb3595f3814fd

実装予定の機能： 制作時や詳細、編集にて文字のフォントを調節出来たり、背景の色や画像を変えられる様にしたい。

ER図:

#user
| Column             | Type   | Option                         |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false , default: ""      |
| email              | string | null: false, foreign_key: true |
| encrypted_password | string | null: false, foreign_key: true |

	has_many :stories
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post



#image
| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| subject_id  | integer    | null: false                    |
| purpose_id  | integer    | null: false                    |
| tale_id     | integer    | null: false                    |
| category_id | integer    | null: false                    |
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

	belongs_to :user
  has_one :category
  has_one :subject
  has_one :purpose
  has_one :tale
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user


#category
| Column | Type   | Option      |
| ------ | ------ | ----------- |
| genre  | string | null: false |
| image  | text   |             |

belongs_to :story

#tale
| Column  | Type   | Option |
| ------- | ------ | ------ |
| content | string |        |

belongs_to :story


#subject
| Column  | Type   | Option |
| ------- | ------ | ------ |
| content | string |        |

belongs_to :story


#purpose
| Column  | Type   | Option |
| ------- | ------ | ------ |
| content | string |        |

belongs_to :story


#comment
| Column   | Type    | Option      |
| -------- | ------- | ----------- |
| user_id  | integer | null: false |
| story_id | integer | null: false |
| text     | text    | null: false |

	belongs_to :user
  belongs_to :story


#like
| Column   | Type    | Option      |
| -------- | ------- | ----------- |
| user_id  | integer | null: false |
| story_id | integer | null: false |

  belongs_to :user
  belongs_to :story

動作方法:

ruby '2.6.5'
gem 'rails', '~> 6.0.0'
gem 'mysql2', '>= 0.5.3'