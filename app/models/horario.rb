class Horario < ActiveRecord::Base
  belongs_to :dentista
  
  def hor_dia
    case read_attribute("hor_dia")
      when 1
        "Domingo"
      when 2
        "Segunda-feira"
      when 3
        "Terça-feira"
      when 4
        "Quarta-feira"
      when 5
        "Quinta-feira"
      when 6
        "Sexta-feira"  
      when 7
        "Sábado" 
    end
    
  end
end
