class ExamSerializer < ActiveModel::Serializer
  attributes :id, :kind, :grade, :year

  belongs_to :subject
  belongs_to :teacher
  belongs_to :user
end
