class Article < ActiveRecord::Base
  attr_accessible :title, :body, :released_at, :expired_at, :member_only
  validates :title, :body, :released_at, presence: true
  validates :title, length: { maximum: 200 }
  validate :check_expired_at

  def chamge
    create_table :articles do |t|
      t.string :title, null: false
    end
  end

  private
  def check_expired_at
    if expired_at && expired_at < released_at
      errors.add(:expired_at, :expired_at_too_old)
    end
  end
end
