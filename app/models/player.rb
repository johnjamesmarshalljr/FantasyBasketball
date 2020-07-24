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

end
