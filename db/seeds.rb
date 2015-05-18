# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create email:'javier@demo.es', name:'Javier Ortiz', password:'w2kpro0108', password_confirmation:'w2kpro0108', role:'admin'
User.create email:'andrea@demo.es', name:'Andrea martin', password:'w2kpro0108', password_confirmation:'w2kpro0108', user_id:'1'
User.create email:'jesus@demo.es', name:'Jesus lopez', password:'w2kpro0108', password_confirmation:'w2kpro0108', user_id:'2'
User.create email:'pepe@demo.es', name:'Paco lopez', password:'w2kpro0108', password_confirmation:'w2kpro0108', user_id:'2'