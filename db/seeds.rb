# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
  users = User.create([{ username: 'octa', password:'admin' }, { username: 'rares', password:'admin' }])
  Museums.create([{name: 'Muzeul de Stiinte Naturale', lat: 45, lon: 40 }, { name: 'Muzeul Bruchental', lat: 45, lon: 40 }])
