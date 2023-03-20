require 'rails_helper'

RSpec.describe 'test user/show', type: :feature do
  before(:all) do
    @user = User.find(340)
  end
  scenario 'users photo test' do
    visit user_path(340)
    expect(page).to have_xpath("//img[@src='#{@user.photo}']")
  end
  scenario 'users name test' do
    visit user_path(340)
    expect(page).to have_content(@user.name)
  end
  scenario 'users post_counter test' do
    visit user_path(340)
    expect(page).to have_content("Number of posts : #{@user.post_counter}")
  end
  scenario 'users bio test' do
    visit user_path(340)
    expect(page).to have_content(@user.bio)
  end
  scenario 'users post test' do
    visit user_path(340)
    @user.post.take(3).each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
      expect(page).to have_content("comments : #{post.comments_counter}")
      expect(page).to have_content("likes : #{post.likes_counter}")
    end
  end
  scenario 'users chack link test' do
    visit user_path(340)
    expect(page).to have_link('See all posts', href: user_post_index_path(user_id: @user.id))
  end
  scenario 'users click see all posts test' do
    visit user_path(340)
    click_on('See all posts')
    expect(page).to have_current_path(user_post_index_path(user_id: @user.id))
  end

  scenario 'users click see all posts test' do
    visit user_path(340)
    first_post = @user.post.take(3)[0]
    click_link(href: "/user/#{@user.id}/post/#{first_post.id}")

    expect(page).to have_current_path(user_post_path(@user, first_post.id))
  end
end
