class UsersController < ApplicationController
  before_action :authenticate_user!

  def set_model_class
    @model_class = User  
  end
    
  
end
