class ContatosController < ApplicationController
  layout "padrao"
  # GET /contatos
  # GET /contatos.xml
  def index
    lista = Contato.find(:all,
                         :conditions =>["clinica_id = ?", session[:clinica_id]],                                
                         :select => "id, ctt_nome, ctt_fone1, ctt_fone2",
                         :order => "ctt_nome") do
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
      format.json { render :json => lista.to_jqgrid_json([:id, :ctt_nome, :ctt_fone1, :ctt_fone2], 
        params[:page], params[:rows], lista.size) }
    end
    
    
  end

  # GET /contatos/1
  # GET /contatos/1.xml
  def show
    @contato = Contato.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contato }
    end
  end

  # GET /contatos/new
  # GET /contatos/new.xml
  def new
    @contato = Contato.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contato }
    end
  end

  # GET /contatos/1/edit
  def edit
    @contato = Contato.find(params[:id])
  end

  # POST /contatos
  # POST /contatos.xml
  def create
    @contato = Contato.new(params[:contato])
    @contato.clinica_id = session[:clinica_id]

    respond_to do |format|
      if @contato.save
        format.html { redirect_to(@contato, :notice => 'Contato was successfully created.') }
        format.xml  { render :xml => @contato, :status => :created, :location => @contato }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contato.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contatos/1
  # PUT /contatos/1.xml
  def update
    @contato = Contato.find(params[:id])

    respond_to do |format|
      if @contato.update_attributes(params[:contato])
        format.html { redirect_to(@contato, :notice => 'Contato was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contato.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contatos/1
  # DELETE /contatos/1.xml
  def destroy
    @contato = Contato.find(params[:id])
    @contato.destroy

    respond_to do |format|
      format.html { redirect_to(contatos_url) }
      format.xml  { head :ok }
    end
  end
  
  def adicionar_favoritos
    @favorito = Meuscontato.new
    @favorito.contato_id = params[:contato_id]
    @favorito.usuario_id = session[:usuario_id]
    @favorito.save
    
    redirect_to(:controller => :contatos, :action => :index)
  end
  
  def remover_favoritos
    @favorito = Meuscontato.first(:conditions => ["contato_id = ? and usuario_id = ?", session[:usuario_id], params[:contato_id]])
    @favorito.destroy
    redirect_to(:controller => :contatos, :action => :index)
  end
end
