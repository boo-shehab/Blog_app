RSpec.describe 'test post/show', type: :feature do
  before(:all) do
    @user = User.create(name: 'Ahmed', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'hello')
    @post = Post.create(author: @user, title: 'Hi', text: 'Bye')
  end

  scenario 'post tiltle and user name test' do
    visit user_post_path(user_id: @user.id, id: @post.id)
    expect(page).to have_content("#{@post.title} by #{@user.name}")
  end

  scenario 'ost comments_counter test' do
    visit user_post_path(user_id: @user.id, id: @post.id)
    expect(page).to have_content("comments : #{@post.comments_counter}")
  end

  scenario 'post likes_counter test' do
    visit user_post_path(user_id: @user.id, id: @post.id)
    expect(page).to have_content("likes : #{@post.likes_counter}")
  end

  scenario 'users posts test' do
    visit user_post_path(user_id: @user.id, id: @post.id)
    expect(page).to have_content(@post.text)
  end

  scenario 'posts comments test' do
    visit user_post_path(user_id: @user.id, id: @post.id)
    @post.comment.each do |comment|
      expect(page).to have_content("#{comment.author.name} : #{comment.text}")
    end
  end
end
