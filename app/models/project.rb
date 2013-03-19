class Project < ActiveRecord::Base
  attr_accessible :description, :name
  validates :name, :presence => true
  has_many :tickets, :dependent => :delete_all
  has_many :permissions, :as => :thing

  scope :viewable_by, lambda { |user|
    joins(:permissions).where(:permissions => { :action => "view",
                                                :user_id => user.id }) }

  def self.for(user)
    user.admin ? Project : Project.viewable_by(user)
  end
end
