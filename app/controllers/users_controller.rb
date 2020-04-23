class UsersController < ApplicationController
  before_action :authenticate_user!

  def set_model_class
    @model_class = User  
  end
  
  def model_params
    params.require(:user).permit(:email, :role)
  end
  
end
