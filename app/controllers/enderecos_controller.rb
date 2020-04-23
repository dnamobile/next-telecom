class EnderecosController < ApplicationController
  before_action :authenticate_user!

  def set_field_classes
    @field_classes = []    
  end

  def set_model_class
    @model_class = Endereco  
  end

  private
    
    def model_params
      params.require(:endereco)
        .permit(:logradouro, :numero, :complemento, 
          local_attributes: [:nome, :atividade],
          cobertura_attributes: [:vivo, :net, :oi])
    end
end
