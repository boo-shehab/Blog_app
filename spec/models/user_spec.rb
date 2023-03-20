require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'ahmed', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'bio') }

  before { user.save }

  it 'name should be present' do
    user.name = nil

    expect(user).to_not be_valid
  end

  it 'post_counter should be present' do
    user.post_counter = nil

    expect(user).to_not be_valid
  end
  it 'post_counter should be integer' do
    user.post_counter = 'b'

    expect(user).to_not be_valid
  end

  it 'post_counter should be greater than or equal to 0' do
    user.post_counter = -1

    expect(user).to_not be_valid
  end

  it 'user should be valid' do
    expect(user).to be_valid
  end
end
