User.destroy_all
Match.destroy_all

admin = User.create!(email: 'felipe@match.com', password: 'abcd1234', is_admin: true)
user2 = User.create!(email: 'renato@match.com', password: 'abcd1234')
user3 = User.create!(email: 'john@match.com', password: 'abcd1234')
user4 = User.create!(email: 'jane@match.com', password: 'abcd1234')
user5 = User.create!(email: 'michael@match.com', password: 'abcd1234')
user6 = User.create!(email: 'tom@match.com', password: 'abcd1234')
user7 = User.create!(email: 'sara@match.com', password: 'abcd1234')
user8 = User.create!(email: 'sergio@match.com', password: 'abcd1234')
