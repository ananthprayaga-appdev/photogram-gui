class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index.html.erb" })
  end

  def show_details
    user_id = params.fetch(:path_username)
    @this_user = User.where({ :username => user_id }).first
    render({ :template => "user_templates/show_details.html.erb" })
  end
end
