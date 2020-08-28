class Tweet < ApplicationRecord
  validates_length_of :tweeet, :within =>1...140
  belongs_to :user
end
