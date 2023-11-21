class User < ApplicationRecord
  has_many :subscriptions
  has_many :programs, through: :subscriptions

  validates :name, presence: true
  validates_format_of :email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i

end
