class ExamSerializer < ActiveModel::Serializer
  attributes :id, :kind, :grade, :year, :images

  belongs_to :subject
  belongs_to :teacher
  belongs_to :user

  def images
    object.exam_images_urls
  end
end
