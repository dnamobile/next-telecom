class BairrosController < ApplicationController
  before_action :authenticate_user!

  def show
    @list = @ref.logradouros.page(params[:page])
  end

  def set_field_classes
    @field_classes = [Logradouro]    
  end

  def set_model_class
    @model_class = Bairro  
  end

  private

    def model_params
      params.require(:bairro).permit(:nome, :zona, :cidade, 
        :qtde_habitantes, :qtde_domicilios, :qtde_empresas, :renda_media)
    end
end
