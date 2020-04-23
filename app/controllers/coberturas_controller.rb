class CoberturasController < ApplicationController
  before_action :authenticate_user!
  
  def set_field_classes
    @field_classes = [Cobertura]    
  end

  def set_model_class
    @model_class = Cobertura  
  end

  private
    def model_params
      params.require(:cobertura).permit(:endereco, :vivo, :net, :oi)
    end
end
