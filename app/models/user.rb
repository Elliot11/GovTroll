# Attributes:
# * id [integer, primary, not null] - primary key
# * created_at [datetime] - creation time
# * current_sign_in_at [datetime] - Devise Trackable module
# * current_sign_in_ip [string] - Devise Trackable module
# * email [string, default="", not null]
# * encrypted_password [string, default="", not null] - Devise encrypted password
# * last_sign_in_at [datetime] - Devise Trackable module
# * last_sign_in_ip [string] - Devise Trackable module
# * name [string]
# * picture [string] - TODO: document me
# * remember_created_at [datetime] - Devise Rememberable module
# * reset_password_sent_at [datetime] - Devise Recoverable module
# * reset_password_token [string] - Devise Recoverable module
# * sign_in_count [integer, default=0, not null] - Devise Trackable module
# * updated_at [datetime] - last update time
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  TEMP_EMAIL_PREFIX = 'govtroll@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  has_many :authentications
  has_many :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  def apply_omniauth(omni)
     authentications.build(:provider => omni['provider'],
     :uid => omni['uid'],
     :token => omni['credentials'].token,
     :token_secret => omni['credentials'].secret)
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the authentication and user if they exist
    authentication = Authentication.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the authentication being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated authentication) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : authentication.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(email:email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          #username: auth.info.nickname || auth.uid,
          picture: auth.extra.raw_info.profile_image_url,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        user.save!
      end
    end

    # Associate the authentication with the user if needed
    if authentication.user != user
      authentication.user = user
      authentication.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  def twitter
    self.authentications.where(:provider => 'twitter').first
  end

  def has_twitter?
    twitter.present?
  end
end
