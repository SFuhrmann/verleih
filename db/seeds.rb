u = User.create(:name => "admin", :email => "admin@admin.de", :password => "administrator", :role => "admin")
u = User.first
u.role = "admin"
u.save

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
