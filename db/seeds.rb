# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#User.create email:'javier@demo.es', name:'Javier Ortiz', password:'w2kpro0108', password_confirmation:'w2kpro0108', role:'admin'
#User.create email:'andrea@demo.es', name:'Andrea martin', password:'w2kpro0108', password_confirmation:'w2kpro0108', user_id:'1'
#User.create email:'jesus@demo.es', name:'Jesus lopez', password:'w2kpro0108', password_confirmation:'w2kpro0108', user_id:'2'
#User.create email:'pepe@demo.es', name:'Paco lopez', password:'w2kpro0108', password_confirmation:'w2kpro0108', user_id:'2'

Event.create title: 'SuperMartxe', description:'Pastilleros a trocoloco', capacity:1000, user_id:1, commission: '1,60', locate:'Humanes de Madrid', date: '17/06/2015', house:'Fabrik'
Event.create title: 'Megatron', description:'Porreros a trocoloco', capacity:500, user_id:1, commission: '2', locate:'Atocha, Madrid', date: '12/01/2016', house:'Kapital'
