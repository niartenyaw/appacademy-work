class Toy < ActiveRecord::Base
  validates_uniqueness_of :name, { scope: [:toyable_id, :toyable_type] }

  belongs_to :owner, polymorphic: true
end
