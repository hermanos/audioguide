# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
  achievement1 = Achievement.create!(title: "First Scan", description: "Congratulations for your first Scan !", image: "no_image")
  achievement2 = Achievement.create!(title: "100 Scans", description: "Congratulations for your 100th Scan !", image: "no_image")
  achievement3 = Achievement.create!(title: "Full Museum", description: "Congratulations for visiting an entire Museum !", image: "no_image")
  achievement4 = Achievement.create!(title: "Rich", description: "Congratulations for optaining 1000 coins !", image: "no_image")

  admin = User.create!(email: 'admin@audioguide.com', password:'admin123')
  admin.profile.update_attribute(:role, "admin")
  manager = User.create(email: 'manager@audioguide.com', password: 'manager123')
  manager.profile.update_attribute(:role, "manager")
  user = User.create(email: 'basic_user@audioguide.com', password: 'user1234')
  user.profile.achievements << achievement1
  user.profile.achievements << achievement2

  Museum.create([{name: 'Muzeul de Stiinte Naturale', lat: 45, long: 40 }, { name: 'Muzeul Brukenthal', lat: 45, long: 40 }])


  

