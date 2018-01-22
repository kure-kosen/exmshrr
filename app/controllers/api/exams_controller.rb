module Api
  class ExamsController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token

    def index
      exams = Exam.eager_load(:user, :subject, :teacher).order(updated_at: :desc)

      render json: filtered(exams), each_serializer: ExamSerializer
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

      def filtered(exams)
        exams = by_grade(exams)
        exams = by_kind(exams)
        exams = by_subject(exams)
        exams = by_teacher(exams)

        exams
      end

      def by_grade(exams)
        return exams if params[:grade].blank?

        exams.where(grade: params[:grade])
      end

      def by_kind(exams)
        return exams if params[:kind].blank?

        exams.where(kind: params[:kind])
      end

      def by_subject(exams)
        return exams if params[:subject_id].blank?

        exams.where(subject_id: params[:subject_id])
      end

      def by_teacher(exams)
        return exams if params[:teacher_id].blank?

        exams.where(teacher_id: params[:teacher_id])
      end
  end
end
