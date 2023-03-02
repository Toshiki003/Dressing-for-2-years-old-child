# 1.upto(20) do |index|
#   Post.seed(
#     :id,
#     {
#       user: User.offset(rand(User.count)).first,
#       title: "title#{index}",
#       content: "content#{index}",
#       category_id: 1
#     }
#   )
# end

Post.seed(:id, [
  { id: 1, user: User.offset(rand(User.count)).first, title: 'お風呂にシャボン玉', content: 'お風呂グッズで悩んでいましたが、うちはシャボン玉をお風呂でやりたがりました。今は飽きちゃいましたが、2ヶ月は一緒に楽しめたので、ぜひお子さんとやってみてはどうでしょうか。', category_id: 1 },
  { id: 2, user: User.offset(rand(User.count)).first, title: '歯磨き粉を２種類用意しています！', content: '口の中に入れる時の味って大切みたいです。最初はいちご味の歯磨き粉をちょっとだけ使っていました。でも慣れてくるとイヤイヤが止まらないので、歯医者さんで試したバナナ味も家で買って選んでもらいました。すると、「今日はバナナくんにしようかな」と歯磨きしてくれるようになりました！他のお家では、どんな味を使っているのでしょうか？',category_id: 2 },
  { id: 3, user: User.offset(rand(User.count)).first, title: '歌で楽しく', content: '動画を見ながら磨くときもあります。「お母さんと一緒」の定番です、リズムに乗れるのでこの動画がおすすめ。',category_id: 2 , embed_youtube: 'https://www.youtube.com/watch?v=bgFz0izvZO4'},
  { id: 4, user: User.offset(rand(User.count)).first, title: 'バイキンがかわいらしい', content: '目玉焼きやケーキなど色々な食べ物が出てきて、「今日これ食べたね」「おいしかったね」と言いながら磨いてます。レパートリーの一つ。',category_id: 2 , embed_youtube: 'https://youtu.be/jCv-GySDm1o'},
  { id: 5, user: User.offset(rand(User.count)).first, title: '洋服の柄選びが大事かも', content: 'お気に入りの洋服ってありますよね。いつもミッフィーちゃんの洋服を着たがります。だんだん上に着る洋服がそれだけになりつつあります。「今日はどのミッフィーと公園行く？」と選んでもらうと、楽しそうです。',category_id: 5 } ,

])