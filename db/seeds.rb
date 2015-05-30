# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Plan.create name: 'Dios', information:'El plan de los dioses, el plan de los admins.', price: 0, max_income: 9999999, max_users: 9999999, max_events: 9999999
Plan.create name: 'Freemium', information:'Plan ideal para empezar con tu fuerza de ventas', price: 10, max_income: 1000, max_users: 3, max_events: 3

User.create email:'administrador@site.es', name:'Javier', last_name: 'Ortiz', invitationHash: SecureRandom.hex(13), password:'w2kpro0108', password_confirmation:'w2kpro0108', photo:'http://placehold.it/250x250', status:'activo', role:'admin', plan_id: 1
User.create email:'jefe@site.es', name:'Raul', user_id: 1, last_name: 'Maroto', invitationHash: SecureRandom.hex(13), password:'w2kpro0108', password_confirmation:'w2kpro0108', photo:'http://placehold.it/250x250', status:'activo', role:'user', plan_id: 2
User.create email:'jefe2@site.es', name:'Aitor', last_name: 'Garcia', invitationHash: SecureRandom.hex(13), password:'w2kpro0108', password_confirmation:'w2kpro0108', photo:'http://placehold.it/250x250', status:'activo', role:'user', plan_id: 2
User.create email:'rrpp1@site.es', name:'Sara', user_id: 2, last_name: 'Garcia', invitationHash: SecureRandom.hex(13), password:'w2kpro0108', password_confirmation:'w2kpro0108', photo:'http://placehold.it/250x250', status:'activo', role:'user', plan_id: 2
User.create email:'rrpp2@site.es', name:'Kim', user_id: 2, last_name: 'Kardashian', invitationHash: SecureRandom.hex(13), password:'w2kpro0108', password_confirmation:'w2kpro0108', photo:'http://placehold.it/250x250', status:'activo', role:'user', plan_id: 2
User.create email:'rrpp3@site.es', name:'Josemi', user_id: 2, last_name: 'Rakuten', invitationHash: SecureRandom.hex(13), password:'w2kpro0108', password_confirmation:'w2kpro0108', photo:'http://placehold.it/250x250', status:'activo', role:'user', plan_id: 2

Event.create title: 'SuperMartxe', description:'La fiesta que todos desean', capacity:1000, user_id:1, commission: '1.60', locate:'Humanes de Madrid', date: '17/06/2015', house:'Fabrik', price: 10, flyer:'/assets/images/flyers/flyer1.jpg'
Event.create title: 'Megatron', description:'¿Pijo yo?', capacity:500, user_id:1, commission: '1.65', locate:'Atocha, Madrid', date: '12/01/2016', house:'Kapital', price: 15, flyer:'/assets/images/flyers/flyer3.jpg'
Event.create title: 'ChikiParty', description:'¿Te apuntas?', capacity:310, user_id:2, commission: '2.50', locate:'Atocha, Madrid', date: '2/06/2016', house:'Shoko', price: 20, flyer:'/assets/images/flyers/flyer2.jpg'
Event.create title: 'PaintGlow', description:'Moderneo y postureo', capacity:230, user_id:2, commission: '2.79', locate:'Atocha, Madrid', date: '30/05/2016', house:'Zoologico', price: 25, flyer:'/assets/images/flyers/flyer4.jpg'
Event.create title: 'PaintGlow', description:'Moderneo y postureo', capacity:230, user_id:3, commission: '3.12', locate:'Atocha, Madrid', date: '30/05/2016', house:'Zoologico', price: 25, flyer:'/assets/images/flyers/flyer5.jpg'
Event.create title: 'PaintGlow', description:'Moderneo y postureo', capacity:230, user_id:3, commission: '2.22', locate:'Atocha, Madrid', date: '30/05/2016', house:'Zoologico', price: 25, flyer:'/assets/images/flyers/flyer6.jpg'
Event.create title: 'PaintGlow', description:'Moderneo y postureo', capacity:230, user_id:3, commission: '1.32', locate:'Atocha, Madrid', date: '30/05/2016', house:'Zoologico', price: 25, flyer:'/assets/images/flyers/flyer7.jpg'


Sale.create event_id: 1, user_id: 2, cuantity: 10, total: 150, sold: '20/05/2015', processed: '25/05/2015', status: 'Pagado', buyer: 'Jose ramon', phone: 658987565, email: 'jose@comprador.es'
Sale.create event_id: 2, user_id: 2, cuantity: 10, total: 150, sold: '20/05/2015', processed: '25/05/2015', status: 'Reservado', buyer: 'Princesita', phone: 515448454, email: 'princesita@comprador.es'
Sale.create event_id: 3, user_id: 4, cuantity: 10, total: 150, sold: '20/05/2015', processed: '25/05/2015', status: 'Pagado', buyer: 'Miriam lopez', phone: 54218756, email: 'miriam@comprador.es'

Notice.create title: 'Apertura de plataforma', content: 'Por fin llego la hora de abrir la nueva web', status: 'alert', icon: 'fa fa-star', user_id: 1
Notice.create title: 'Registro activo', content: 'Por fin llego la hora de abrir la nueva web', status: 'alert', icon: 'fa fa-user', user_id: 1
Notice.create title: 'Activado sistema mensajeria', content: 'Por fin llego la hora de abrir la nueva web', status: 'alert', icon: 'fa fa-envelope-o', user_id: 1




