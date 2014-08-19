class Vote < ActiveRecord::Base
  belongs_to :entry
  belongs_to :member

  attr_accessible :entry_id

end
