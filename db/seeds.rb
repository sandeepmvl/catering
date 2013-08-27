# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
Role.find_or_create_by_name({ :name => role }, :without_protection => true)
puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup,
:password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin
user = User.find_or_create_by_email :name => 'Silver User', :email => 'user@example.com', :password=> 'password', :password_confirmation => 'password'
user.add_role :silver
user1 = User.find_or_create_by_email :name => 'Gold User', :email => 'user1@example.com', :password =>'changeme', :password_confirmation => 'changeme'
user1.add_role :gold
user2 = User.find_or_create_by_email :name => 'Platinum User', :email => 'user2@example.com', :password=> 'changeme', :password_confirmation => 'changeme'
user2.add_role :platinum
puts "users: #{user.name}, #{user1.name}, #{user2.name}"

