1.upto(10) do |user|
  User.seed(
    # 基本はidでseed-fuは投下データの同一性を判断する。idは省略可能なので、ユニークなemailで同一性判断をする場合の書き方になる。
    # 参考:https://qiita.com/punkshiraishi/items/18c80475fcd50d708dc4
    :email,
    {
      name: "test_#{user}",
      email: "test#{user}@example.com",
      crypted_password: "password#{user}",
      salt: "password#{user}"
    }
  )
end
