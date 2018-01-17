module Api
  class ExamsController < ApplicationController
    def index
      @exams = Exam.all

      render json: @exams, each_serializer: ExamSerializer
    end

    def create
      # @exam = current_user.exams.build(exam_params)
      @exam = Exam.new(exam_params)
      @exam.user = User.first

      if @exam.save
        render json: @exam, serializer: ExamSerializer
      else
        render_errors @exam
      end
    end

    def show
      @exam = Exam.find(params[:id])

      render json: @exam, serializer: ExamSerializer
    end

    private

      def exam_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:subject_id, :teacher_id, :kind, :grade, :year, :images])
      end
  end
end
