module EnderecosHelper

    def atividades
        ["Comercial", "Residencial"]
    end
  
    def logradouros
        l = Array.new
        l[0] = Logradouro.first
        l[1] = Logradouro.find(1000)
        @logradouros = l
    end  

end
