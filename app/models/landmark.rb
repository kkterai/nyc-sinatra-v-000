class Landmark <ActiveRecord::Base

  belongs_to :figure

  validates :year_completed, presence: true
  validates :name, presence: true

end
