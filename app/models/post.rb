# Attributes:
# * id [integer, primary, not null] - primary key
# * content [text] - TODO: document me
# * created_at [datetime] - creation time
# * title [string]
# * updated_at [datetime] - last update time
# * user_id [integer] - belongs to :user
class Post < ActiveRecord::Base

  belongs_to :user
  has_many :targets

  validates :user,
            presence: true

  validates :title,
            length: {maximum: 100},
            presence: true

  validates :content,
            length: {maximum: 1000},
            presence: true

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
