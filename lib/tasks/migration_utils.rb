class MigrationUtils

    #buscando logradouro ja cadastrado
    def self.save_logradouro(c, b, cep, n, i, f, l)
        
         log = Logradouro.where(cep: cep, cidade: c, bairro: b, inicio: i, fim: f, lado: l).first
         if log == nil
            puts "Criando novo logradouro..."
            log = Logradouro.create!(cep: cep, cidade: c, bairro: b, nome: n, inicio: i, fim: f, lado: l)
            puts log
         else
            puts ">>>> Logradouro Já cadastrado #{cep}"
         end   
         log
    end

    #buscando endereco ja cadastrado
    def self.save_endereco(log, numero, comp)
        
        e = Endereco.where(logradouro: log, numero: numero, complemento: comp).first
        if e == nil
          puts "Criando novo endereco..."
          puts Endereco.create!(logradouro: log, numero: numero, complemento: comp)
        else
          puts ">>> Endereco ja cadastrado #{cep} #{numero}"
        end
        e
    end
    
end