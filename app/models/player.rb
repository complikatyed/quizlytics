class Player < ActiveRecord::Base
  has_many :player_games
  has_many :games, through: :player_games
  has_many :player_teams
  has_many :teams, through: :player_teams
  has_many :player_team_games
  has_many :team_games, through: :player_team_games

# NEED SOME WAY TO STRIP CELL PHONE NUMBER IN ORDER TO VALIDATE IT...

  validates :first_name, :last_name, :email, :cell, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :cell, format: { :with => /\A(\+1)?[0-9]{10}\z/, :message => "Not a valid 10-digit telephone number" }
  validates :email, format: { with: /.+@.+\..+/, message: "must be an email address" }
  validates :points, :negs, numericality: true

  before_validation :set_defaults,  on: :create

  private

  def set_defaults
    self.points ||= 0
    self.negs ||= 0
  end

end
