class Paciente < ActiveRecord::Base
  
  validates_presence_of :pac_nome, :pac_celular
  
  #named_scope :por_organizacao, :conditions => ["clinica_id = ?", session[:clinica_id]]
  
end
