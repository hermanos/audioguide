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

  Exhibit.create([{title: 'Sculptura transilvăneană în piatră din secolele XIII-XIX', description: 'Colecţia de piese sculpturale transilvănene medievale şi moderne timpurii din piatră a fost constituită treptat, începând cu prima jumătate a secolului al XIX-lea. 
  Ea cuprinde piese databile în secolele XIII-XIX. 
  În decursul secolului al XIX-lea, dar şi în secolul al XX-lea, numărul acestora a crescut continuu, mai ales prin achiziţii şi donaţii. Marea majoritate a pieselor provine însă din Sibiu, ca rezultat al permanentelor transformări de natură edilitară, survenite cu precădere în cursul ultimelor două secole.
  Expoziţia permanentă intitulată Sculptura transilvăneană în piatră din secolele XIII-XIX cuprinde exponate structurate pe mai multe categorii. 
  Criteriul cronologic şi ordinul arhitectonic primează, dar au fost avute în vedere şi materialele din care au fost realizate piesele sau anumite particularităţi de natură stilistică. 
  În cadrul expoziţiei pot fi regăsite piese ale unor elemente arhitectonice, statui, blazoane, inscripţii de construcţie, monumente sau elemente ale unor ansambluri funerare, reliefuri decorative. 
  Remarcabile sunt exponatele realizate din alabastru (blazoane şi alte reliefuri decorative), o statuie alegorică din calcar, reprezentând Luxuria şi piesele considerate în sec. XIX drept antichităţi romane.',audio: nil, video: nil, floor: 0, lat: 40, long: 40, qr_code: 'http://10.0.0.64:3000/museums/2/exhibits/1',museum_id: 2}]);
