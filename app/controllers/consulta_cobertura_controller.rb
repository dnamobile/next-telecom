class ConsultaCoberturaController < ApplicationController
  
  def search
    if params.blank?
      set_list
    end
  end
  
  private
    def set_field_classes
      @field_classes = [Cobertura]    
    end

    def set_model_class
      @model_class = Cobertura  
    end

    def model_params
      params.require(:cobertura).permit(:endereco, :vivo, :net, :oi)
    end

end
