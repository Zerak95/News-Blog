class Topic < ApplicationRecord
    has_many :posts, dependent: :destroy
    validates :name,  presence: true, length: { maximum: 25 }
    validates_uniqueness_of :name
end
