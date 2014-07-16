# Attributes:
# * id [integer, primary, not null] - primary key
# * created_at [datetime] - creation time
# * person_id [integer, not null] - TODO: document me
# * politician_id [integer] - TODO: document me
# * post_id [integer] - belongs to :post
# * updated_at [datetime] - last update time
class Target < ActiveRecord::Base
  belongs_to :post

  validates :person_id,
          presence: true
end
