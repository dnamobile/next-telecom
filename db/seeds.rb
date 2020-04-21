# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

#puts "> Criando Bando de Dados..."
#Rake::Task["db:create"].invoke

#puts "> Criando Tabelas..."
#Rake::Task["db:migrate"].invoke

puts "> Inserindo Dados.."
Rake::Task["utils:clear_data"].invoke
Rake::Task["utils:setup_estados"].invoke
Rake::Task["utils:setup_cidades"].invoke
Rake::Task["utils:setup_bairros"].invoke
Rake::Task["utils:setup_logradouros"].invoke
Rake::Task["utils:setup_enderecos"].invoke
#Rake::Task["utils:setup_locais"].invoke
#Rake::Task["utils:setup_coberturas"].invoke