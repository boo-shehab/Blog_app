require 'rails_helper'

RSpec.describe 'test post/index', type: :feature do
  before(:all) do
    @user = User.find(340)
    @posts = Post.where(author_id: @user.id).includes(comment: [:author])
  end
  scenario 'posts photo test' do
    visit user_post_index_path(340)
    expect(page).to have_xpath("//img[@src='#{@user.photo}']")
  end
  scenario 'users name test' do
    visit user_post_index_path(340)
    expect(page).to have_content(@user.name)
  end
  scenario 'users post_counter test' do
    visit user_post_index_path(340)
    expect(page).to have_content("Number of posts : #{@user.post_counter}")
  end
  scenario 'users posts test' do
    visit user_post_index_path(340)
    @posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
      expect(page).to have_content("comments : #{post.comments_counter}")
      expect(page).to have_content("likes : #{post.likes_counter}")
    end
  end
  scenario 'posts comments test' do
    visit user_post_index_path(340)
    @posts.each do |post|
      expect(page).to have_content(post.comment[0].text) if post.comment.nil?
    end
  end
  scenario 'users click see all posts test' do
    visit user_post_index_path(340)
    first_post = @posts.first
    click_link(href: "/user/#{@user.id}/post/#{first_post.id}")
    expect(page).to have_current_path(user_post_path(user_id: @user.id, id: first_post.id))
  end
end
