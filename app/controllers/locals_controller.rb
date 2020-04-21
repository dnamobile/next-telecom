class LocalsController < ApplicationController
 
  def set_field_classes
    @field_classes = []    
  end

  def set_model_class
    @model_class = Local  
  end

  private
    
    def model_params
      params.require(:local).permit(:nome, :atividade, :endereco)
    end
end
