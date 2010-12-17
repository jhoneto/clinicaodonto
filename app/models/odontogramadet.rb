#enum de ações
#1 - esquerda
#2 - direita
#3 - cima
#4 - baixo
#5 - centro

class Odontogramadet < ActiveRecord::Base
  belongs_to :odontograma
end
