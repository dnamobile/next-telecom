class PessoasController < ApplicationController
  
  #Garante que só será acessado com usuário logado
  before_action :authenticate_user!

  def show
    @list = @ref.atendimentos.page(params[:page])
  end
  
  private

  def set_field_classes
    @field_classes = [Atendimento]    
  end

  def set_model_class
    @model_class = Pessoa 
  end
  
  def model_params
    params.require(:pessoa).permit(:nome, :email, :telefone)
  end
  
end