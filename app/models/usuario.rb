require('digest/sha2')
class Usuario < ActiveRecord::Base
  belongs_to :clinica
  before_save :criptografia_senha
  
  def criptografia_senha
      self.usu_senha = Digest::SHA256.hexdigest(usu_senha);
  end
end
