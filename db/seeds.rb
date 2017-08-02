# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.new({:name => "Sam",:email => 'Sam@google.com', :password => '123456'}).save
User.new({:name => "Alex",:email => 'Alex@google.com', :password => '123456'}).save
User.new({:name => "Tom",:email => 'Tom@google.com', :password => '123456'}).save
Message.new({:author => 1, :receiver => 2, :text => 'Hello!'}).save
Message.new({:author => 2, :receiver => 1, :text => 'How are you?!'}).save