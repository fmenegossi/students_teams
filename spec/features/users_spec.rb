require 'rails_helper'

describe 'user page', js: true do
  let(:user) { User.create(email: 'renato@match.com', password: 'abcd1234') }
  let(:user2) { User.create(email: 'john@match.com', password: 'abcd1234') }
  let(:admin) { User.create(email: 'tom@match.com', password: 'abcd1234', is_admin: true) }

  let(:match) { Match.create(date: Date.today) }

  let(:matchup) { UserMatch.create(match: match, user: user) }
  let(:matchup1) { UserMatch.create(match: match, user: user2) }

  it " expects user2 to be today's match column" do
    validate_matchups

    login user
    visit users_path

    expect(find('.today-column')).to have_content(user2.email)
  end

  it ' expects user email  to be in the navbar' do
    validate_matchups
    login user
    visit users_path

    expect(find('.navbar-right')).to have_content(user.email)
  end

  it ' expects "student"  to be in the navbar' do
    validate_matchups
    login user
    visit users_path

    expect(find('.navbar-right')).to have_content('Student')
  end

  it ' expects "Admin"  to be in the navbar' do
    validate_matchups
    login admin
    visit users_path

    expect(find('.navbar-right')).to have_content('Admin')
  end

  it ' expects button promote to change to demote' do
    validate_matchups
    login admin
    visit users_path

    find('#pills-users-tab').click
    find('.roles-list > div:first-child > button').click

    expect(find('.roles-list > div:first-child > button').text).to eq('Demote')
  end
end

def validate_matchups
  matchup.valid?
  matchup1.valid?
end

def login(user_to_login)
  visit new_user_session_path

  fill_in 'user_email', with: user_to_login.email
  fill_in 'user_password', with: user_to_login.password
  click_on 'Log in'
end
