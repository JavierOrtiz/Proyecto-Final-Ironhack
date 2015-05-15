# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create email:'pepe@demo.es', name:'Pepe lopez', password:'1234', password_confirmation:'w2kpro0108'
User.create email:'andrea@demo.es', name:'Andrea martin', password:'1234', password_confirmation:'w2kpro0108'
User.create email:'jesus@demo.es', name:'Jesus lopez', password:'1234', password_confirmation:'w2kpro0108'