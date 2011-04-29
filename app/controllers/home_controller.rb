class HomeController < ApplicationController
  before_filter :usuario_autenticado?
  layout "padrao"
  def index
    favoritos = Contato.find(:all,
                                 :conditions =>["clinica_id = ? and usuario_id = ?", session[:clinica_id], session[:usuario_id]],
                                 :joins => "as contatos inner join meuscontatos as mc on mc.contato_id = contatos.id",
                                 :select => "mc.id, ctt_nome, ctt_fone1, ctt_fone2") do
      if params[:_search] == "true"
        ctt_nome  =~ "%#{params[:ctt_nome]}%" if params[:ctt_nome].present?
        ctt_fone1 =~ "%#{params[:ctt_fone1]}%" if params[:ctt_fone1].present?
        ctt_fone2 =~ "%#{params[:ctt_fone2]}%" if params[:ctt_fone2].present?     
      end
      paginate :page => params[:page], :per_page => params[:rows]      
      order_by "#{params[:sidx]} #{params[:sord]}"
    end
    
    respond_to do |format|
      format.html
      format.json { render :json => favoritos.to_jqgrid_json([:id,  :ctt_nome, :ctt_fone1, :ctt_fone2], 
        params[:page], params[:rows], favoritos.total_entries) }
    end
  end
  
end
