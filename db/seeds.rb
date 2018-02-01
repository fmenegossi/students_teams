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
#
# match1 = Match.create!(date: Date.today)
# match2 = Match.create!(date: Date.today)
# match3 = Match.create!(date: Date.today)
# match4 = Match.create!(date: Date.today + 3.days)
# match5 = Match.create!(date: Date.today + 3.days)
# match6 = Match.create!(date: Date.today + 1.days)
#
# matchu1 = UserMatch.create!(match:match1, user: user2)
# matchu2 = UserMatch.create!(match:match1, user: user3)
#
# matchu3 = UserMatch.create!(match:match2, user: user4)
# matchu4 = UserMatch.create!(match:match2, user: user5)
#
# matchu5 = UserMatch.create!(match:match3, user: user6)
# matchu6 = UserMatch.create!(match:match3, user: user7)
#
# matchu7 = UserMatch.create!(match:match4, user: user8)
# matchu8 = UserMatch.create!(match:match4, user: user2)
#
# matchu9 = UserMatch.create!(match:match5, user: user2)
# matchu10 = UserMatch.create!(match:match5, user: user5)
#
# matchu11 = UserMatch.create!(match:match6, user: user2)
# matchu12 = UserMatch.create!(match:match6, user: user4)
#
# matchu13 = UserMatch.create!(match:match6, user: user5)
