class LogradourosController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @list = @ref.enderecos
  end

  def set_field_classes
    @field_classes = [Endereco]    
  end

  def set_model_class
    @model_class = Logradouro  
  end

  private
  
    def model_params
      params.require(:logradouro).permit(:cidade, :bairro, :nome, :cep, :inicio, :fim, :lado)
    end
end
