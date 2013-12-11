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

@proposal1 = Proposal.new(:title => 'Proposal Title', :summary => 'Create a website to determine feasibility of ideas.', :body => 'My goal is to create a website that helps determine whether or not an idea is feasible. I want to ensure that business students don\'t invest a large amount of time creating a business model for an idea that simply isn\'t feasible for a programmatic standpoint.', :user_id => @buser.id)

@review1 = Review.new(:proposal_id => @proposal1.id, :user_id => @euser.id, :comment => 'This is a great idea!', :rating => 5, :plausible_language => 'PHP', :user_interested => TRUE)
