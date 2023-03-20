require 'rails_helper'

RSpec.describe 'test user/index', type: :feature do
  before(:all) do
    @users = User.all
  end
  scenario 'users name test' do
    visit root_path
    @users.each do |user|
      expect(page).to have_content(user.name)
    end
  end
  scenario 'users photo test' do
    visit root_path
    @users.each do |user|
      expect(page).to have_xpath("//img[@src='#{user.photo}']")
    end
  end
  scenario 'users post_counter test' do
    visit root_path
    @users.each do |user|
      expect(page).to have_content("Number of posts : #{user.post_counter}")
    end
  end
  scenario 'users click test' do
    visit root_path
    @users.each do |user|
      expect(page).to have_link(user.name, href: user_path(user))
    end
  end
end
