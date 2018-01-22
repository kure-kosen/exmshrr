module Api
  class ExamsController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token

    def index
      @exams = Exam.all.order(updated_at: :desc)

      render json: @exams, each_serializer: ExamSerializer
    end

    def create
      @exam = current_user.exams.build(exam_params)

      if @exam.save
        render json: @exam, serializer: ExamSerializer
      else
        render @exam.errors
      end
    end

    def show
      @exam = Exam.find(params[:id])

      render json: @exam, serializer: ExamSerializer
    end

    private

      def exam_params
        exam = { subject_id: params["subject_id"],
                 teacher_id: params["teacher_id"],
                 kind: params["kind"],
                 grade: params["grade"],
                 exam_images: params["exam_images"] }

        params = ActionController::Parameters.new({ exam: exam })

        params.require(:exam).permit(:subject_id, :teacher_id, :kind, :grade, :year, { exam_images: [] })
      end
  end
end
