1.upto(20) do |index|
  Post.seed(
  :id,
  {
    user: User.offset(rand(User.count)).first,
    title: "title#{index}",
    content: "content#{index}"
  }
  )
end