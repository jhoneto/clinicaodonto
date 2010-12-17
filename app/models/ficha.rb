class Ficha < ActiveRecord::Base
  belongs_to :dentista
  belongs_to :paciente
end
