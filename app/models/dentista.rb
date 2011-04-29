class Dentista < ActiveRecord::Base
  
  validates_presence_of :den_nome
  
end
