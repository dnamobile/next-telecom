class LocalsController < ApplicationController
  before_action :authenticate_user!
   

  def set_model_class
    @model_class = Local  
  end

  private
    
    def model_params
      params.require(:local).permit(:nome, :atividade, :endereco)
    end
end
