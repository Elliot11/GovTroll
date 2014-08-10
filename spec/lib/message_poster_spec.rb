require 'rails_helper'

describe MessagePoster do

  describe 'Twitter posting' do
    before :each do
      @user = FactoryGirl.create(:user)
      @contact_with_twitter = FactoryGirl.create(:contact, facebook: nil, email: nil)
      @post = FactoryGirl.create(:post, user: @user)
    end

    it 'creates a TwitterPoster when the contact has a twitter account' do
      message_poster = MessagePoster.new(@user, @contact_with_twitter, @post)
      message_poster.send(:create_posters)
      expect(message_poster.posters.first).to be_an_instance_of Posters::Twitter
    end

  end

  describe 'Facebook posting' do
    before :each do
      @user = FactoryGirl.create(:user)
      @contact_with_facebook = FactoryGirl.create(:contact, twitter: nil, email: nil)
      @post = FactoryGirl.create(:post, user: @user)
    end

    it 'creates a FacebookPoster when the contact has a facebook account' do
      message_poster = MessagePoster.new(@user, @contact_with_facebook, @post)
      message_poster.send(:create_posters)
      expect(message_poster.posters.first).to be_an_instance_of Posters::Facebook
    end

  end

  describe 'Email posting' do
    before :each do
      @user = FactoryGirl.create(:user)
      @contact_with_email = FactoryGirl.create(:contact, twitter: nil, facebook: nil)
      @post = FactoryGirl.create(:post, user: @user)
    end

    it 'creates an EmailPoster when the contact has a email account' do
      message_poster = MessagePoster.new(@user, @contact_with_email, @post)
      message_poster.send(:create_posters)
      expect(message_poster.posters.first).to be_an_instance_of Posters::Email
    end

  end

end