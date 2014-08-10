class MessagePoster
  attr_accessor :user, :contacts, :post, :posters
  def initialize(user, contacts, post)
    @user, @post = user, post
    @contacts = [contacts].flatten
    @posters = []
  end

  private

  def create_posters
    @contacts.each do |contact|
      unless contact.twitter.blank?
        posters << Posters::Twitter.new(contact, post)
      end

      unless contact.facebook.blank?
        posters << Posters::Facebook.new(contact, post)
      end

      unless contact.email.blank?
        posters << Posters::Email.new(contact, post)
      end
    end
  end

end