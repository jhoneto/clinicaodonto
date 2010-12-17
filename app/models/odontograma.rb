class Odontograma < ActiveRecord::Base
  belongs_to :paciente
  has_many :odontogramadet
end
