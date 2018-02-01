class Api::GroupsControlles < Api::BaseApiController

  def create
    group = Group.new(get_group_params)

    if group.save
      render(
        {
          status: 201,
          json: group
        }
      )
    else
      render(
        {
          status: 422,
          json:{
            message: "Something is going wrong...",
            errors: group.errors
          }
        }
      )
  end

  private

  def get_group_params
    params.require(:group).permit(:name, :start_date, :end_date)
  end
end
