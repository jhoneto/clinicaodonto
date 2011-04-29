class Contato < ActiveRecord::Base
  has_many :meuscontato
  
  validates_presence_of :ctt_nome, :ctt_fone1
end
