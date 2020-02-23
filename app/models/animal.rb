class Animal < ApplicationRecord
  validates_presence_of :specie, :breed, :age, :gender
  validates :age, numericality: {only_integer: true}
  before_save :downcase_params

  def downcase_params
    self.specie.downcase!
    self.breed.downcase!
    self.gender.downcase!
  end

  def self.search(keyword)
    keyword.downcase!
    where(specie: keyword).or(where(breed: keyword)).or(where(gender: keyword)).all
  end
end
