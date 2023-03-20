require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.new(title: 'title', text: 'text', author_id: 1) }

  before { post.save }

  it 'title should be present' do
    post.title = nil

    expect(post).to_not be_valid
  end

  it 'title should be not exceed 250 characters' do
    post.title = 'a' * 251

    expect(post).to_not be_valid
  end

  it 'comments_counter should be present' do
    post.comments_counter = nil

    expect(post).to_not be_valid
  end
  it 'comments_counter should be integer' do
    post.comments_counter = 'b'

    expect(post).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to 0' do
    post.comments_counter = -1

    expect(post).to_not be_valid
  end

  it 'likes_counter should be present' do
    post.likes_counter = nil

    expect(post).to_not be_valid
  end
  it 'likes_counter should be integer' do
    post.likes_counter = 'b'

    expect(post).to_not be_valid
  end

  it 'likes_counter should be greater than or equal to 0' do
    post.likes_counter = -1

    expect(post).to_not be_valid
  end
end
