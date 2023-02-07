D2C - Dressing for 2 years old children -

２歳児の身支度を楽しくするアプリ

![facebook_cover_photo_1.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7fa2b917-8289-4206-8917-779d5105fb59/facebook_cover_photo_1.png)

## ■サービス概要3行

- イヤイヤ期（2歳頃)に入った子どもが、
- 毎日楽しく身支度ができるように、
- 我が家の工夫を投稿し共有できるサービスです

## ■メインのターゲットユーザー

- 2歳前後の子育てをしている親
- 毎日子どもが楽しんでお風呂や歯磨きなどの生活や身支度をできるようにしたい親

## ■ユーザーが抱える課題

- 日々の子育てで疲労を感じている
- 「最近毎回お風呂に嫌がって時間がかかる。何か機嫌よくお風呂に入れるようにできないかな。」など感じている
- 「今日はどうしても嫌がって磨かない。1日ぐらい歯磨きしなくても大丈夫」とスキップすると翌日「昨日は仕上げ磨きしなかったもん！」と違う理由で嫌がる…など、歯磨きの悩みを抱えている

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e5ca1b4b-4258-4f2b-8ecb-e8f656fb2a46/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6373c3f0-e66c-4834-ab6b-8f8996e68e89/Untitled.png)

お風呂、歯磨きを嫌がる子どものイメージ

*フリー画像からです

YouTubeの検索キーワードでも、「お風呂　子供　入らない」や「歯磨きの歌」など多くの候補がヒットする。このことから、子どもに楽しくお風呂や歯磨きをしてもらいたいニーズは十分あると考えた。

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/77e52633-4c02-43bc-be7a-86837a086302/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/37343fd6-5ff7-4eb8-806c-9961a99d92d6/Untitled.png)

## ■解決方法

- ユーザーは、「うちの工夫」を投稿できる。投稿された工夫を共有し、「うちの子にもやってみようかな」と取り入れることで、毎日の身支度を子どもと楽しく行えるようにする。
    - 「うちの工夫」では、コンテンツが豊富なYoutube動画を埋め込むことができるようにして、使ってよかった動画を共有することで、楽しくお風呂や歯磨きなどの身支度ができるようにする。
- お気に入りの動画はブックマークしておき、「今日はこれにする」と子ども自身が動画を選択して楽しんでお風呂に入る、といった生活ができるようにする。

## ■実装予定の機能

- ユーザーログイン/ ログアウト機能(sorcery)
    - ゲストログイン機能
    - パスワードリセット機能
- 「うちの工夫」一覧、投稿、詳細、編集、削除機能　★メイン機能
    - YouTube動画埋め込み機能
- なるほど!機能（≒いいね機能）
- ブックマーク機能
- コメント機能
- 複数タグづけ機能（ユーザー側で自由にタグ付けできる）#3歳 , #男の子, #3人姉妹 など
- ※カテゴリ機能（アプリ側で設定。プルダウンでユーザーが選択）
- 新着の投稿表示機能(topページに配置)
- よく見られている投稿表示(topページに配置)
- ユーザープロフィール編集機能
- 管理者機能（ユーザー、うちの工夫、YouTube埋め込み、コメントのCRUD)

## ※カテゴリ機能について

1, **★お風呂**

**2, ★歯磨き**

**3,** お片付け

4, 食事

5, 着替え

6, お出かけ

カテゴリはアプリ側で指定。MVPリリースでは、お風呂と歯磨きの2つに絞る。

なおアイデア相談会にてご指摘をいただき、初期コンテンツを充実させ投稿ハードルを下げる意味でメディア寄りで作成していく方針です。

## ■なぜこのサービスを作りたいのか？

- 身支度のお世話をする、お手伝いをする、というのは誰にとっても簡単なことではありません。食事はもちろん、着替えやお風呂、歯磨き、お出かけの時のあれこれなど、まだ1人でできない or できるようになったばかりの2歳児は大変な時期だなと思います。

　（もちろん子育ては楽しい部分もたくさんたくさんあります！！）

- 昨日まで楽しんでいた歌や手順でも、ある日「これじゃないの」と泣き叫ぶこともあります。イヤイヤの程度によりますが、泣き止まない、どうしようもならない、とこれが続くと親も気持ちが滅入ってしまうことは私だけでなく誰しもあると思います。
- 話を聞いてあげたり抱っこしてあげたりしても、それでもなかなか気持ちが乗らない時もあり、お風呂に入るのに説得で30分かかることもあります。
- 例えば朝、時間がなくて歯磨きなどを無理やりしてしまうと、次からもっと嫌がってしまいます。嫌がらず毎日の習慣に組み込むことに親は苦心しています。**楽しく・機嫌よく毎日身支度ができることは、子どもにとっても親にとっても大切なことだと思います。**
- だからこそ、「他のお家では歯磨きとかどうしているのかを知りたいな」と思ったし、「動画と歌を中心に親子で笑顔で楽しめるサービスがあるといいな」と思い作成しようと考えました。

## ■スケジュール

企画〜技術調査 2/5~2/9

README〜ER図作成2/10~2/15

メイン機能実装2/15~2/28

RUNTEQ内リリース(MVPリリース)2/28

本リリース3/15
