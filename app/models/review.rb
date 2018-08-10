class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: (0..4).to_a}
end
