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
        posters << TwitterPoster.new(contact, post)
      end

      unless contact.facebook.blank?
        posters << FacebookPoster.new(contact, post)
      end

      unless contact.email.blank?
        posters << EmailPoster.new(contact, post)
      end
    end
  end

end