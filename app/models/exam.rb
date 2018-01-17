class Exam < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher
  belongs_to :user

  validates :images, presence: true

  extend Enumerize
  enumerize :kind, in: %i[early_mid early_end late_mid late_end]
end
