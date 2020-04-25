require 'csv'

#Comando para rodar a migracao no bando produção
#rake utils:setup_locais RAILS_ENV=production

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
    puts "#{Estado.all.size} encontrados"
    
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
    puts "#{Cidade.all.size} encontrados"

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
    puts "#{Logradouro.all.size} encontrados"
    
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

        save_logradouro(c, b, cep, n, i, f, l)
      end
    end
  end

  desc "Povoa a tabela Endereços no Banco"  
    task setup_enderecos: :environment do
      puts "> Povoando Tabela Endereços..."
      puts "#{Endereco.all.size} encontrados"
      
      c = Cidade.find_by(nome: "Teresina")
      CSV.foreach('tmp/enderecos.csv', encoding:'iso-8859-1:utf-8', col_sep: ';').with_index do |linha, indice|
        unless (indice == 0)

          cep = linha[0]
          lNome = linha[1] != nil ? linha[1] : nil
          numero = linha[2]
          comp = linha[3] != nil ? linha[3].swapcase : nil
          b = linha[4] != nil ? linha[4].swapcase : nil
          
          bairro = Bairro.find_by(nome: b)
          
          #buscando logradouro ja cadastrado
          log = save_logradouro(c, b, cep, lNome, 0, 99999, "Ambos")

          #buscando endereco ja cadastrado
          save_endereco(log, numero, comp)
        end
      end
    end
  
    desc "Povoa a tabela Locais no Banco"  
    task setup_locais: :environment do
      puts "> Povoando Tabela Locais..."
      puts "#{Local.all.size} encontrados"

      c = Cidade.find_by(nome: "Teresina")
      CSV.foreach('tmp/locais.csv', encoding:'iso-8859-1:utf-8', col_sep: ';').with_index do |linha, indice|
        unless (indice == 0)
        
          nome = linha[0] != nil ? linha[0] : nil
          atv = linha[1]
          cep = linha[2]
          numero = linha[3]
          bl = linha[4].to_i
          lt = linha[5].to_i  
          
          #buscando logradouro ja cadastrado
          #log = save_logradouro(c, b, cep, lNome, 0, 99999, "Ambos")
          log = Logradouro.where(cep: cep, cidade: c).first

          if log != nil
            #buscando endereco ja cadastrado
            e = save_endereco(log, numero, nil)
              
            save_local(e, nome, atv, bl, lt)
          else
            puts ">>> Logradouro #{log} não encontrado <<<Local não salvo>>>"
          end
        end
      end
    end

    desc "Povoa a tabela Coberturas no Banco"  
    task setup_coberturas: :environment do
      setup_cobertura("oi", "tmp/coberturaOi.csv")
      #setup_cobertura("net", "tmp/coberturaNet.csv")
      #setup_cobertura("vivo", "tmp/coberturaVivo.csv")
    end


    #buscando logradouro ja cadastrado
    def save_logradouro(c, b, cep, n, i, f, l)    
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
     def save_endereco(log, numero, comp) 
        e = Endereco.where(logradouro: log, numero: numero, complemento: comp).first
        if e == nil
          puts "Criando novo endereco..."
          e = Endereco.create!(logradouro: log, numero: numero, complemento: comp)
          puts e
        else
          puts ">>> Endereco ja cadastrado #{log.cep} #{numero}"
        end
        e
     end

     #buscando local ja cadastrado
     def save_local(e, nome, atv, bl, lt)
        local = Local.where(endereco: e, nome: nome, atividade: atv).first
        if local == nil
          puts "Criando novo local..."
          local = Local.create!(endereco: e, nome: nome, atividade: atv)
          puts local
        else
          puts ">>> Local ja cadastrado #{nome} - #{e}"
        end
        e
      end

      #buscando cobertura ja cadastrada
     def save_cobertura(e, op, c)
      cob = Cobertura.where(endereco: e).first
      v = (op == 'vivo') ? c : nil;
      o = (op == 'oi') ? c : nil;
      n = (op == 'net') ? c : nil;
      
      if cob == nil
        puts "Criando nova Cobertura..."
        
        cob = Cobertura.create!(endereco: e, vivo: v, net: n, oi: o)
        puts cob
      else
        puts ">>> Atualizando Cobertura cadastrada #{e}"
        if (op == 'vivo') 
          cob.vivo = c
        end
        if (op == 'oi') 
          cob.oi = c
        end
        if (op == 'net') 
          cob.net = c
        end
        cob.save
      end
      cob
    end

    def setup_cobertura(op, file)
      puts "> Povoando Tabela Coberturas para #{op}..."
      puts "#{Cobertura.all.size} encontrados"

      CSV.foreach(file, encoding:'iso-8859-1:utf-8', col_sep: ';').with_index do |linha, indice|
        unless (indice == 0)

          cep = linha[0]
          numero = linha[1]
          comp = linha[2] != nil ? linha[2].swapcase : nil
          
          c = linha[3].to_i;

          log = Logradouro.find_by(cep: cep)
          e = save_endereco(log, numero, comp)
          
          save_cobertura(e, op, c)
        end
      end
    end
  end