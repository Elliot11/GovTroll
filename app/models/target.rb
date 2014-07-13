class Target < ActiveRecord::Base
  belongs_to :post

  validates :person_id,
          presence: true
end