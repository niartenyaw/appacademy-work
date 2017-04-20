class House < ActiveRecord::Base
  validates :address, :presence => true

  has_many :people

  # has_many(
  #   :people,
  #   :class_key => "Person",
  #   :foreign_key => :house_id,
  #   :primary_key => :id
  # )
end
