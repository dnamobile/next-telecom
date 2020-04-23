class EstadosController < ApplicationController
  
  #Garante que só será acessado com usuário logado
  before_action :authenticate_user!

  def show
    @list = @ref.cidades.page(params[:page])
  end
  
  private

  def set_field_classes
    @field_classes = [Cidade]    
  end

  def set_model_class
    @model_class = Estado  
  end
  
  def model_params
    params.require(:estado).permit(:nome, :uf)
  end
  
end