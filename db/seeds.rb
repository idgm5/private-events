# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Jhon Smith')
User.create(name: 'Mary Mendez')
User.create(name: 'George Ortiz')
User.create(name: 'Jvier Padilla')
User.create(name: 'Selena Gomez')
User.create(name: 'Freddy Mercury')
User.create(name: 'Bill Gates')

Event.create(description: 'Mana',creator_id: 1, event_date: '2019-01-15')
Event.create(description: 'Mana',creator_id: User.find_by(name: 'Jhon Smith').id, event_date: '2019-01-15')
Event.create(description: 'The Beatles',creator_id: User.find_by(name: 'Mary Mendez').id, event_date: '2019-01-15')
Event.create(description: 'The Rolling Stones',creator_id: User.find_by(name: 'George Ortiz').id, event_date: '2019-01-15')
Event.create(description: 'Led Zeppelin',creator_id: User.find_by(name: 'Jvier Padilla').id, event_date: '2019-01-15')
Event.create(description: 'The Doors',creator_id: User.find_by(name: 'Jhon Smith').id, event_date: '2019-01-15')
Event.create(description: 'Pink Floyd',creator_id: User.find_by(name: 'Jhon Smith').id, event_date: '2020-01-15')
Event.create(description: 'The Beach Boys',creator_id: User.find_by(name: 'Jhon Smith').id, event_date: '2020-01-15')
Event.create(description: 'The Who',creator_id: User.find_by(name: 'Mary Mendez').id, event_date: '2020-01-15')
Event.create(description: 'Simon & Garfunkel',creator_id: User.find_by(name: 'George Ortiz').id, event_date: '2020-06-15')
Event.create(description: 'U2',creator_id: User.find_by(name: 'Jvier Padilla').id, event_date: '2020-06-18')
Event.create(description: 'Cream',creator_id: User.find_by(name: 'Jhon Smith').id, event_date: '2020-06-25')
Event.create(description: 'The Velvet Underground',creator_id: User.find_by(name: 'Jhon Smith').id, event_date: '2020-06-19')

Attendance.create(user_id:  User.find_by(name: 'Bill Gates').id, event_id:Event.find_by(description: 'Mana').id)
Attendance.create(user_id:  User.find_by(name: 'Freddy Mercury').id, event_id:Event.find_by(description: 'The Beatles').id)
Attendance.create(user_id:  User.find_by(name: 'Bill Gates').id, event_id:Event.find_by(description: 'The Rolling Stones').id)
Attendance.create(user_id:  User.find_by(name: 'Freddy Mercury').id, event_id:Event.find_by(description: 'The Who').id)
Attendance.create(user_id:  User.find_by(name: 'Bill Gates').id, event_id:Event.find_by(description: 'Cream').id)
Attendance.create(user_id:  User.find_by(name: 'Freddy Mercury').id, event_id:Event.find_by(description: 'Simon & Garfunkel').id)
