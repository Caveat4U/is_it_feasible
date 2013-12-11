# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#User.create({ email: 'e@gmail.com'}, {encrypted_password: '$2a$10$vHCJorsbez7ZqC/SlHp5Vu4fJ8lL/cQf2d9vh4Ub0o9FiZpI.l.aG'} )

#User.new({ :email => 'b@gmail.com'}, {:first_name => 'First'}, {:last_name => 'Last'}, {:major => 'Business'}, {:encrypted_password => '$2a$10$vHCJorsbez7ZqC/SlHp5Vu4fJ8lL/cQf2d9vh4Ub0o9FiZpI.l.aG'} )

@euser = User.new(:email => 'e@gmail.com', :password => 'password', :password_confirmation => 'password', :first_name => 'First', :last_name => 'Last', :major => 'Engineering')
@euser.save

@buser = User.new(:email => 'b@gmail.com', :password => 'password', :password_confirmation => 'password', :first_name => 'First', :last_name => 'Last', :major => 'Business')
@buser.save
