module LogradourosHelper

    def lados
        ["Ímpar", "Par", "Ambos"]
    end

    def cidades
        Cidade.all
    end

    def bairros
        Bairro.all
    end
    
end
