class LocalsController < ApplicationController
  before_action :authenticate_user!
   

  
  private
    def set_model_class
      @model_class = Local  
    end

    def set_field_classes
      @field_classes = []    
    end
    
    def model_params
      params.require(:local).permit(:nome, :atividade, :endereco)
    end
end
