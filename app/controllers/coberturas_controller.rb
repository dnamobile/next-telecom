class CoberturasController < ApplicationController
  before_action :authenticate_user!


  private
  
    def set_field_classes
      @field_classes = []    
    end

    def set_model_class
      @model_class = Cobertura  
    end
    def model_params
      params.require(:cobertura).permit(:endereco, :vivo, :net, :oi)
    end
end
