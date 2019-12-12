# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
dhh = User.create do |user|
  user.name = "dhh"
  user.email = "dhh@rails.com"
  user.birthday = "1979-10-15"
  user.password = "password"
end

matz = User.create do |user|
  user.name = "matz"
  user.email = "matz@rails.com"
  user.birthday = "1965-04-14"
  user.password = "password"
end

(1..20).each do |i|
  Task.create do |task|
    task.name = "task #{i}"
    task.deadline = i.days.since
    task.status = false
    task.user_id = (i <= 10 ? dhh.id : matz.id)
  end
end

  