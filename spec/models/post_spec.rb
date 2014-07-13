require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:post) { FactoryGirl.build_stubbed :post }

  subject {post}

  it {should respond_to :user}
  it {should validate_presence_of :user}

  it {should have_many :targets}
end