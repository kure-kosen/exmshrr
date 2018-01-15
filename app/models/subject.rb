class Subject < ApplicationRecord
  has_many :exams, dependent: :nullify

  validates :name, presence: true
end
