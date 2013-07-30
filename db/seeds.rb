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
  manager = User.create!(email: 'manager@audioguide.com', password: 'manager123')
  manager.profile.update_attribute(:role, "manager")
  user = User.create(email: 'basic_user@audioguide.com', password: 'user1234')

   user.profile.achievements << achievement1
   user.profile.achievements << achievement2

 muzeu0 = Museum.create!(name: 'Outside', lat: 0, long: 0, description: "Exponatele care sunt in exteriorul muzeelor", manager_id: admin.profile.id, published: 1)
  muzeu1 = Museum.create!(name: 'Muzeul de Stiinte Naturale', lat: 45.75515, long: 24.116297, description: "Cel mai tare muzeu", manager_id: manager.profile.id, published: 0)
  muzeu2 = Museum.create!(name: 'Muzeul Brukenthal', lat: 45.79652, long: 24.150545, description: "Al doilea cel mai tare", manager_id: admin.profile.id, published: 0)

  exhibit1 = Exhibit.create!(title: 'Sculptura transilvaneana in piatra din secolele XIII-XIX', description: 'Colectia de piese sculpturale transilvanene medievale si moderne timpurii din piatra a fost constituita treptat, incepand cu prima jumatate a secolului al XIX-lea. ', video: nil, floor: 0, lat: 40, long: 40, qr_code: 'http://10.0.0.64:3000/museums/2/exhibits/1', museum_id: 1)
  exhibit2 = Exhibit.create!(title: 'Monalisa', description: 'Pictura. ',audio: nil, video: nil, floor: 0, lat: 40, long: 40, qr_code: 'http://10.0.0.64:3000/museums/2/exhibits/2', museum_id: 2, private: 0)

  
  scan1 = Scan.create(profile_id: user.profile.id, exhibit_id: exhibit1.id)
  scan2 = Scan.create(profile_id: user.profile.id, exhibit_id: exhibit2.id)

