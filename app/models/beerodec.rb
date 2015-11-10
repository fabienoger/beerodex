class Beerodec < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user

  scope :by_user_id, -> id { where(user_id: id) }
end
