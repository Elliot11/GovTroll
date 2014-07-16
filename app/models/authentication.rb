# Attributes:
# * id [integer, primary, not null] - primary key
# * created_at [datetime] - creation time
# * provider [string] - TODO: document me
# * secret [string] - TODO: document me
# * token [string] - TODO: document me
# * uid [string] - TODO: document me
# * updated_at [datetime] - last update time
# * user_id [integer] - belongs to :user
class Authentication < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, scope: :provider

  def self.find_for_oauth(auth)
    authentication = find_by provider:auth.provider, uid:auth.uid
    authentication = create(uid:auth.uid, provider:auth.provider, token:auth.credentials.token, secret:auth.credentials.secret) if authentication.nil?
    authentication
  end
end
