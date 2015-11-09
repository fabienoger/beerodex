class Beer < ActiveRecord::Base
  validates :name, presence: {
    message: "Le nom de la bière doit être renseigné."
  }
  validates :degrees, presence: {
    message: "Le degrès doit être renseigné."
  }
  validates :country, presence: {
    message: "Le pays doit être renseigné."
  }
  validates :quality_hangover, presence: {
    message: "Le rapport qualité cuite de la bière doit être renseigné."
  }
  validates :technical_sheet, presence: {
    message: "La fiche technique doit être renseigné."
  }
end
