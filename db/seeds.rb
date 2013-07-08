# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
  admin = User.create!(email: 'admin@audioguide.com', password:'admin123')
  admin.profile.role = 'admin'
  manager = User.create(email: 'manager@audioguide.com', password: 'manager123')
  manager.profile.role = 'manager'
  user = User.create(email: 'user23434@audioguide.com', password: 'user123')
  Museum.create([{name: 'Muzeul de Stiinte Naturale', lat: 45, long: 40 }, { name: 'Muzeul Brukenthal', lat: 45, long: 40 }])
