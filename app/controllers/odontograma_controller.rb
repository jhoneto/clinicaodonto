class OdontogramaController < ApplicationController
  layout "padrao" 
  def index
    #dentes
    if params[:pacienteid] != nil
      @pacienteId = params[:pacienteid]
    else
      @pacienteId = session[:odontogramaid]
    end
    
    @odontograma = Odontograma.first(:conditions => ["paciente_id = ?", @pacienteId])
    session[:odontogramaid] = @odontograma.id
    div_dente_cima = "<div id='dente' style='position:absolute; width:25px; height:25px; z-index:7; top: 222px; overflow: visible;' >"
    div_dente_baixo = "<div id='dente' style='position:absolute; width:25px; height:25px; z-index:7; top: 248px; overflow: visible;' >"
    div_dente_baixo2 = "<div id='dente' style='position:absolute; width:25px; height:25px; z-index:7; top: 248px; overflow: visible;' >"
    #div_img_dente_cima ="<div id='dente' style='position:absolute; width:25px; height:70px; top: 197px; overflow: visible;' >"
    div_img_dente_baixo ="<div id='dente' style='position:absolute; width:25px; height:70px; top: 280px; overflow: visible;' >"
    
    @odontograma_view = "<table><tr>"
    18.downto(11) { 
      |n| 
      @odontograma_view = @odontograma_view + "<td><img src='../images/dentes/" + n.to_s(10) +".png' width='25' height='70' style='filter: Alpha(Opacity=60);'></td>" 
    }
    
    21.upto(28) { 
      |n| 
      @odontograma_view = @odontograma_view + "<td><img src='../images/dentes/" + n.to_s(10) +".png' width='25' height='70' style='filter: Alpha(Opacity=60);'></td>"
    }
    

   @odontograma_view = @odontograma_view + "</tr><tr>"
    18.downto(11) { 
      |n|
      
      acoes = Odontogramadet.find(:all,
                                  :conditions => ["odd_dente = ? and odontograma_id = ?", n, @odontograma.id])
      dente_map = "<td>" + div_dente_cima
      dente_map = dente_map + "<img src='../images/dentes/dente-map.png' width='25' height='25' style='filter: Alpha(Opacity=60); border: 1px dotted #FF6699;'>"
      dente_map = dente_map + "</div>"
      
      # Verifica as ações sobre o dente
      for acao in acoes
        dente_map = dente_map + div_dente_cima
        dente_map =  dente_map + "<img src='../images/dentes/" + acao.procedimento.pro_imagem + "' width='25' height='25' style='filter: Alpha(Opacity=60); border: 1px dotted #FF6699;'>"
        dente_map = dente_map + "</div>"
      end
      
      dente_map = dente_map + "</td>"
      
      @odontograma_view = @odontograma_view + dente_map
      
    }
     
    21.upto(28) { 
      |n|
      
      acoes = Odontogramadet.find(:all,
                                  :conditions => ["odd_dente = ? and odontograma_id = ?", n, @odontograma.id])
      dente_map = "<td>" + div_dente_cima
      dente_map = dente_map + "<img src='../images/dentes/dente-map.png' width='25' height='25' style='filter: Alpha(Opacity=60); border: 1px dotted #FF6699;'>"
      dente_map = dente_map + "</div>"
      # Verifica as ações sobre o dente
      for acao in acoes
        dente_map = dente_map + div_dente_cima
        dente_map =  dente_map + "<img src='../images/dentes/"+ acao.procedimento.pro_imagem + "' width='25' height='25' style='filter: Alpha(Opacity=60); border: 1px dotted #FF6699;'>"
        dente_map = dente_map + "</div>"
      end
      
      
      dente_map = dente_map + "</div></td>"
      
      @odontograma_view = @odontograma_view + dente_map
      
    }
    
    @odontograma_view = @odontograma_view + "</tr><tr>"
    38.downto(31) { 
      |n|
      
      acoes = Odontogramadet.find(:all,
                                  :conditions => ["odd_dente = ? and odontograma_id = ?", n, @odontograma.id])
      dente_map = "<td>" + div_dente_baixo
      dente_map = dente_map + "<img src='../images/dentes/dente-map.png' width='25' height='25' style='filter: Alpha(Opacity=60); border: 1px dotted #FF6699;'>"
      dente_map = dente_map + "</div>"
      
      # Verifica as ações sobre o dente
      for acao in acoes
        dente_map = dente_map + div_dente_baixo2
        dente_map =  dente_map + "<img src='../images/dentes/" + acao.procedimento.pro_imagem + "' width='25' height='25' style='filter: Alpha(Opacity=60); border: 1px dotted #FF6699;'>"
        dente_map = dente_map + "</div>"
      end
      
      dente_map = dente_map + "</div></td>"
      
      @odontograma_view = @odontograma_view + dente_map
      
    }
     
    41.upto(48) { 
      |n|
      
      acoes = Odontogramadet.find(:all,
                                  :conditions => ["odd_dente = ? and odontograma_id = ?", n, @odontograma.id])
      dente_map = "<td>" + div_dente_baixo
      dente_map = dente_map + "<img src='../images/dentes/dente-map.png' width='25' height='25' style='filter: Alpha(Opacity=60); border: 1px dotted #FF6699;'>"
      dente_map = dente_map + "</div>"
      
      # Verifica as ações sobre o dente
      for acao in acoes
        dente_map = dente_map + div_dente_baixo2
        dente_map =  dente_map + "<img src='../images/dentes/" +   acao.procedimento.pro_imagem + "' width='25' height='25' style='filter: Alpha(Opacity=60); border: 1px dotted #FF6699;'>"
        dente_map = dente_map + "</div>"
      end
      
      
      dente_map = dente_map + "</div></td>"
      
      @odontograma_view = @odontograma_view + dente_map
      
    }
    
    @odontograma_view = @odontograma_view + "</tr><tr>"
    
    38.downto(31) { 
      |n| 
      @odontograma_view =  @odontograma_view + "<td>" + div_img_dente_baixo + "<img src='../images/dentes/" + n.to_s(10) +".png' width='25' height='70' style='filter: Alpha(Opacity=60);'></div></td>"
    }
    
    41.upto(48) { 
      |n| 
      @odontograma_view = @odontograma_view + "<td>" + div_img_dente_baixo + "<img src='../images/dentes/" + n.to_s(10) +".png' width='25' height='70' style='filter: Alpha(Opacity=60);'></div></td>"
    }
    
    @odontograma_view = @odontograma_view + "</tr></table>"
    
    
  end
  
  def salvar
    
    @detalhe = Odontogramadet.new
    @detalhe.odd_dente = params[:dente]
    @detalhe.procedimento_id  = params[:acao]
    @detalhe.odontograma_id = session[:odontogramaid]
    
    @detalhe.save
    
    redirect_to(:controller => :odontograma, :action => :index)
  end
end
