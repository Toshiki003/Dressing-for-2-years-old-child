User.seed(:email) do |s|
  s.name = 'toshiki003'
  s.email = 'tototo@example.com'
  s.password = 'password'
  s.password_confirmation = 'password'
  s.role = 0
  s.avatar = 8
end

User.seed(:email) do |s|
  s.name = 'きよし'
  s.email = 'kiyo@example.com'
  s.password = 'password'
  s.password_confirmation = 'password'
  s.role = 0
  s.avatar = 7
end
