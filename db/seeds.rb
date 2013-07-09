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
  user.profile.update_attribute(:coins, 100)

  user.profile.achievements << achievement1
  user.profile.achievements << achievement2

  muzeu1 = Museum.create!(name: 'Muzeul de Stiinte Naturale', lat: 45, long: 40)
  muzeu2 = Museum.create!(name: 'Muzeul Brukenthal', lat: 45, long: 40)
  muzeu2.update_attribute(:manager_id, 2)

  exhibit1 = Exhibit.create!(title: 'Sculptura transilvăneană în piatră din secolele XIII-XIX', description: 'Colecţia de piese sculpturale transilvănene medievale şi moderne timpurii din piatră a fost constituită treptat, începând cu prima jumătate a secolului al XIX-lea. ',audio: nil, video: nil, floor: 0, lat: 40, long: 40, qr_code: 'http://10.0.0.64:3000/museums/2/exhibits/1',museum_id: 2)
  exhibit2 = Exhibit.create!(title: 'Monalisa', description: 'Pictura. ',audio: nil, video: nil, floor: 0, lat: 40, long: 40, qr_code: 'http://10.0.0.64:3000/museums/2/exhibits/2',museum_id: 2)

  scan1 = Scan.create(profile_id: user.profile.id, exhibit_id: exhibit1.id)
  scan2 = Scan.create(profile_id: user.profile.id, exhibit_id: exhibit2.id)
