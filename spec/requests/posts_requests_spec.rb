require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create(name: 'ahmed', photo: 'image', bio: 'bio') }
  describe 'Test post index' do
    it 'Status test' do
      get user_post_index_path(user_id: user.id)
      expect(response).to have_http_status(200)
    end
    it 'template test' do
      get user_post_index_path(user_id: user.id)
      expect(response).to render_template('index')
    end
    it 'test response body' do
      get user_post_index_path(user_id: user.id)
      expect(response.body).to include 'index post'
    end
  end

  describe 'Test post show' do
    let(:post) { Post.create(title: 'tilte', text: 'text', author_id: user.id) }
    let(:post_path_for_an_id) { user_post_path(user_id: user.id, id: post.id) }
    it 'Status test' do
      get post_path_for_an_id
      expect(response).to have_http_status(200)
    end
    it 'template test' do
      get post_path_for_an_id
      expect(response).to render_template('show')
    end
    it 'test response body' do
      get post_path_for_an_id
      expect(response.body).to include 'show post'
    end
  end
end
