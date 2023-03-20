RSpec.describe 'test post/show', type: :feature do
  before(:all) do
    @user = User.find(340)
    @post = Post.includes(comment: [:author]).find(46)
  end

  scenario 'post tiltle and user name test' do
    visit user_post_path(user_id: 340, id: 46)
    expect(page).to have_content("#{@post.title} by #{@user.name}")
  end

  scenario 'ost comments_counter test' do
    visit user_post_path(user_id: 340, id: 46)
    expect(page).to have_content("comments : #{@post.comments_counter}")
  end

  scenario 'post likes_counter test' do
    visit user_post_path(user_id: 340, id: 46)
    expect(page).to have_content("likes : #{@post.likes_counter}")
  end

  scenario 'users posts test' do
    visit user_post_path(user_id: 340, id: 46)
    expect(page).to have_content(@post.text)
  end

  scenario 'posts comments test' do
    visit user_post_path(user_id: 340, id: 46)
    @post.comment.each do |comment|
      expect(page).to have_content("#{comment.author.name} : #{comment.text}")
    end
  end
end
