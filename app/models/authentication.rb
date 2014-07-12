class Authentication < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, scope: :provider

  def self.find_for_oauth(auth)
    authentication = find_by provider:auth.provider, uid:auth.uid
    authentication = create(uid:auth.uid, provider:auth.provider) if authentication.nil?
    authentication
  end
end