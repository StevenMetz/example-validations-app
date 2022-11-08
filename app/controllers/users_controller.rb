class UsersController < ApplicationController
  def index
    users = User.all
    render json: users.as_json
  end

  def create
    users = User.new(
      first_name: params["first_name"],
      last_name: params["last_name"],
      email: params["email"],
    )
    @users = users
    users.save
    render json: users.as_json
  end

  def show
    users = User.find_by(id: params["id"])
    render json: users.as_json
  end

  def update
    users = User.find_by(id: params["id"])
    users.first_name = params["first_name"] || users.first_name ||
                       users.last_name = params["last_name"] || users.last_name ||
                                         users.email = params["email"] || users.email
    @users = users
    users.save
    render json: users.as_json
  end

  def delete
    users = User.find_by(id: params["id"])
    users.destroy
    render json: { message: "User Deleted" }
  end
end
