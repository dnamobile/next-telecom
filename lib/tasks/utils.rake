require 'csv'

namespace :utils do
  
  desc "Limpa os dados das tabelas do Banco"
  task clear_data: :environment do
    puts "> Limpando Tabela Coberturas..."
    Cobertura.destroy_all
    
    puts "> Limpando Tabela Locais..."
    Local.destroy_all
    
    puts "> Limpando Tabela Enderecos..."
    Endereco.destroy_all
    
    puts "> Limpando Tabela Logradouros..."
    Logradouro.destroy_all
    
    puts "> Limpando Tabela Bairros..."
    Bairro.destroy_all
    
    puts "> Limpando Tabela Cidades..."
    Cidade.destroy_all
    
    puts "> Limpando Tabela Estados..."
    Estado.destroy_all
  end

  
  desc "Povoa a tabela Estados no Banco"
  task setup_estados: :environment do
    puts "> Povoando Tabela Estados..."
    CSV.foreach('tmp/estados.csv', encoding:'iso-8859-1:utf-8', col_sep: ';').with_index do |linha, indice|
      unless (indice == 0)
        nome = linha[0]
        uf = linha[1]
        puts Estado.create!(nome: nome, uf: uf)
      end
    end  
  end

  desc "Povoa a tabela Cidades no Banco"
  task setup_cidades: :environment do
    puts "> Povoando Tabela Cidades..."
    e = Estado.find_by(uf: "PI")
    Cidade.create([
      {nome: "Teresina", estado: e},
      {nome: "Parnaíba", estado: e},
      {nome: "Piripiri", estado: e}])
    
    puts Cidade.all
  end

  desc "Povoa a tabela Bairros no Banco"
  task setup_bairros: :environment do
    puts "> Povoando Tabela Bairros..."
    c = Cidade.find_by(nome: "Teresina")
    
    CSV.foreach('tmp/bairros.csv', encoding:'iso-8859-1:utf-8', col_sep: ';').with_index do |linha, indice|
      unless (indice == 0)
        z = linha[0]
        n = linha[1]
        h = linha[2].to_i
        d = linha[3].to_i
        e = linha[4].to_i
        r = linha[5].to_f
        Bairro.create!(zona: z, nome: n, qtde_habitantes: h, qtde_domicilios: d,  qtde_empresas: e, renda_media: r, cidade: c)
      end
    end
        
    puts Bairro.all
  end

  desc "Povoa a tabela Logradouros no Banco"
  task setup_logradouros: :environment do
    puts "> Povoando Tabela Logradouros..."
    
    CSV.foreach('tmp/logradouros.csv', encoding:'iso-8859-1:utf-8', col_sep: ';').with_index do |linha, indice|
      unless (indice == 0)
        cep = linha[0]
        c = Cidade.find_by(nome: linha[1])
        b = Bairro.find_by(nome: linha[2])
        n = linha[3]
        loc = linha[4]
        
        i = linha[5].to_i
        if i == nil
          i = 0
        end
        
        f = linha[6].to_i
        if f == nil
          f = 99999
        end

        l = linha[7]
        if l == nil? 
          l = "Ambos"
        end

        #buscando logradouro ja cadastrado
        log = Logradouro.where(cep: cep, inicio: i, fim: f, lado: l, bairro: b, cidade: c)

        if log == nil
          puts Logradouro.create!(cep: cep, cidade: c, bairro: b, nome: n, inicio: i, fim: f, lado: l)
        else
          puts ">>>> Já cadastrado #{log.cep}"
        end
      end
    end
  end

  desc "Povoa a tabela Endereços no Banco"  
    task setup_enderecos: :environment do
      puts "> Povoando Tabela Endereços..."
      
      CSV.foreach('tmp/enderecos.csv', encoding:'iso-8859-1:utf-8', col_sep: ';').with_index do |linha, indice|
        unless (indice == 0)

          cep = linha[0]
          lNome = linha[1] != nil ? linha[1].swapcase : nil
          numero = linha[2]
          comp = linha[3] != nil ? linha[3].swapcase : nil
          b = linha[4] != nil ? linha[4].swapcase : nil
          
          bairro = Bairro.find_by(nome: b)
          log = Logradouro.find_by(cep: cep)
          
          if log == nil
            puts "Criando novo logradouro..."
            c = Cidade.find_by(nome: "Teresina")
            log = Logradouro.create!(cep: cep, nome: lNome, inicio: 0, fim: 99999, lado: "ambos", cidade: c, bairro: bairro)
            puts ">>> " + log.to_s
          end

          puts Endereco.create!(logradouro: log, numero: numero, complemento: comp)
        end
      end
    end
  
    desc "Povoa a tabela Locais no Banco"  
    task setup_locais: :environment do
      puts "> Povoando Tabela Locais..."
      
      CSV.foreach('tmp/locais.csv', encoding:'iso-8859-1:utf-8', col_sep: ';').with_index do |linha, indice|
        unless (indice == 0)
        
          nome = linha[0] != nil ? linha[0] : nil
          atv = linha[1]
          cep = linha[2]
          numero = linha[3]
          bl = linha[4].to_i
          lt = linha[5].to_i  
          
          log = Logradouro.find_by(cep: cep)
          e = Endereco.where(logradouro: log, numero: numero).first

          if (log != nil && e == nil)
            puts "Criando novo endereço..."
            e = Endereco.create!(logradouro: log, numero: numero)
            puts ">>> " + e.to_s
          end
          
          puts Local.create!(endereco: e, nome: nome, atividade: atv, qtde_blocos: bl, qtde_lotes: lt)
        end
      end
    end

    desc "Povoa a tabela Coberturas no Banco"  
    task setup_coberturas: :environment do
      puts "> Povoando Tabela Coberturas..."
      
      CSV.foreach('tmp/coberturaOi.csv', encoding:'iso-8859-1:utf-8', col_sep: ';').with_index do |linha, indice|
        unless (indice == 0)

          cep = linha[0]
          numero = linha[1]
          comp = linha[2] != nil ? linha[2].swapcase : nil
          
          o = linha[3].to_i;
          o != nil ? o : 0;

          v = 0;
          n = 0;  

          log = Logradouro.find_by(cep: cep)
          e = Endereco.where(logradouro: log, numero: numero, complemento: comp).first

          if (log != nil && e == nil)
            puts "Criando novo endereço..."
            e = Endereco.create!(logradouro: log, numero: numero, complemento: comp)
            puts ">>> " + e.to_s
          end
          
          puts Cobertura.create!(endereco: e, vivo: v, net: n, oi: o)
        end
      end
    end
  end