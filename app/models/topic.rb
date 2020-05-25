class Topic < ApplicationRecord
    validates :name,  presence: true, length: { maximum: 25 }
    validates_uniqueness_of :name
end
