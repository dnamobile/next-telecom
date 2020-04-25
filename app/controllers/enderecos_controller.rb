class EnderecosController < ApplicationController
  before_action :authenticate_user!

  def new
    @ref = @model_class.new
    @ref.build_local
    authorize @ref
  end
  
  def edit
    if @ref.local.blank?
      @ref.build_local
    end
    authorize @ref
  end

  private
  
    def set_field_classes
      @field_classes = []    
    end

    def set_model_class
      @model_class = Endereco  
    end
  
    def model_params
      params.require(:endereco)
        .permit(:logradouro, :numero, :complemento, 
          local_attributes: [:nome, :atividade],
          cobertura_attributes: [:vivo, :net, :oi])
    end
end
