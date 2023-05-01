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

  def add_user
    # Parameters: {"query_username"=>"test"}
    new_username = params.fetch("query_username")
    a_new_user = User.new
    a_new_user.username = new_username
    a_new_user.save()
    redirect_to("/users/" + new_username)
  end

  def update_user
    user_id = params.fetch("updated_user_id")
    matching_user = User.where({ :id => user_id })
    the_user = matching_user.at(0)

    new_username = params.fetch("input_username")
    the_user.username = new_username
    the_user.save()
    redirect_to("/users/" + new_username)
  end
end
