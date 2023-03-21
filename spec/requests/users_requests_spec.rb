require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    let(:user) { User.create(name: 'Ahmed', photo: 'image', bio: 'bio') }
    it 'Status test' do
      get user_index_path
      expect(response).to have_http_status(200)
    end
    it 'template test' do
      get user_index_path
      expect(response).to render_template('index')
    end
    it 'test response body' do
      get user_index_path
      expect(response.body).to include user.name
    end
  end

  describe 'GET /show' do
    let(:user) { User.create(name: 'ahmed', photo: 'image', bio: 'bio') }
    let(:user_path_for_index) { user_path(id: user.id) }
    it 'Status test' do
      get user_path_for_index
      expect(response).to have_http_status(200)
    end
    it 'template test' do
      get user_path_for_index
      expect(response).to render_template('show')
    end
    it 'test response body' do
      get user_path_for_index
      expect(response.body).to include user.name
    end
  end
end
