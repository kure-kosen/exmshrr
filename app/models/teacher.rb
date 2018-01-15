class Teacher < ApplicationRecord
  has_many :exams, dependent: :nullify

  validates :name, presence: true
end
