class Animal < ApplicationRecord
  validates_presence_of :specie, :breed, :age, :gender
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :gender, inclusion: { in: %w(Male male Female female),
                         message: "%{value} is not a valid, choose Male or Female" }
  validates :specie, :breed, format: { with: /\A[a-zA-Z]+\z/,
                                       message: "only allows letters" }
  before_save :downcase_params

  def downcase_params
    self.specie.downcase!
    self.breed.downcase!
    self.gender.downcase!
  end

  def self.search(keyword)
    keyword.downcase!
    where("specie LIKE ? OR breed LIKE ?", "%#{keyword}%", "%#{keyword}%").or(where(gender: keyword))
  end
end
