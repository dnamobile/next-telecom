class CidadesController < ApplicationController
  before_action :authenticate_user!

  def show
    @list = @ref.bairros.page(params[:page])
  end

  private

  def set_field_classes
    @field_classes = [Bairro]    
  end

  def set_model_class
    @model_class = Cidade  
  end

  def model_params
    params.require(:cidade).permit(:nome, :estado)
  end
end
