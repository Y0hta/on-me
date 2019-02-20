User.destroy_all

# Create User
10.times do |i|
  User.create(name: "user#{i}", email: "user#{i}@test.com", password: "password")
end
