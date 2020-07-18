class Player < ApplicationRecord
    has_many :teams
    has_many :users, through: :teams

def self.get_guards
  self.where("position LIKE ? ", "G")
end

def self.get_forwards
  self.where("position LIKE ? ", "F")
end

def self.get_centers
  self.where("position LIKE ? ", "C")
end

def fullname
  firstName + ' '+  lastName
end

def self.custom_all
  everyone = Player.where.not(position: "").order(:position).collect{|p| p}
  # binding.pry

  forward = Player.find_by(firstName: "-- Forward")
  guard = Player.find_by(firstName: "-- Guard")
  center = Player.find_by(firstName: "-- Center")
  everyone.insert(0, center)
  f_index = everyone.find_index{|player| player.position == "F"}
  everyone.insert(f_index, forward)
  g_index = everyone.find_index{|player| player.position == "G"}
  everyone.insert(g_index, guard)
end





end
