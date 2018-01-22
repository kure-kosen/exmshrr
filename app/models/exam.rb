class Exam < ApplicationRecord
  require "carrierwave/orm/activerecord"
  mount_uploaders :exam_images, ExamImageUploader

  belongs_to :subject
  belongs_to :teacher
  belongs_to :user

  validates :exam_images, presence: true

  extend Enumerize
  enumerize :kind, in: { 前期中間: 0,
                         前期末: 1,
                         後期中間: 2,
                         学年末: 3 }
end
