class Api::StudentGroupsControlles < Api::BaseApiController
  before_action :set_student_group, only: [:destroy]

  def create
    student_group = StudentGroup.new(get_student_group_params)

    if student_group.save
      render(
        {
          status: 201,
          json: student_group
        }
      )
    else
      render(
        {
          status: 422,
          json:{
            message: "Something is going wrong...",
            errors: student_group.errors
          }
        }
      )
  end

  def destroy
    if @student_group.destroy
      render(
        {
          status: 200,
          json:{
            message: "Student removed"
          }
        }
      )
    else
      render(
        {
          status: 422,
          json:{
            message: "Error on removing",
            errors: @student_group.errors
          }
        }
      )
  end

  private

  def get_student_group_params
    params.require(:student_group).permit(:user, :group)
  end

  def set_student_group
    @student_group = StudentGroup.where(get_student_group_params)
  end
end
