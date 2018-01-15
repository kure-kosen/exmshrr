class Exam < ApplicationRecord
  validates :images, presence: true

  enumerize :type, in: %i[early_mid early_end late_mid late_end]
end
