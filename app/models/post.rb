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
end