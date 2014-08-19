class Entry < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :member

  end
