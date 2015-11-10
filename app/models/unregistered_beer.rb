class UnregisteredBeer < ActiveRecord::Base
  validates :name, presence: {
    message: "Le nom de la bière doit être renseigné."
  }
  validates :degrees, presence: {
    message: "Le degrès doit être renseigné."
  }
end
