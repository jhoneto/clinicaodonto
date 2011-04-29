class PacientesController < ApplicationController
  before_filter :usuario_autenticado?
  layout "padrao"
  # GET /pacientes
  # GET /pacientes.xml
  def index
    lista = Paciente.find(:all,
                          :conditions =>["clinica_id = ?", session[:clinica_id]],                                
                          :select => "id, pac_nome, pac_fone, pac_celular",
                          :order => "pac_nome") do
      if params[:_search] == "true"
        pac_nome  =~ "%#{params[:pac_nome]}%" if params[:pac_nome].present?
        pac_fone =~ "%#{params[:pac_fone]}%" if params[:pac_fone].present?
        pac_celular =~ "%#{params[:pac_celular]}%" if params[:pac_celular].present?     
      end
      paginate :page => params[:page], :per_page => params[:rows]      
      order_by "#{params[:sidx]} #{params[:sord]}"
    end
    
    respond_to do |format|
      format.html
      format.json { render :json => lista.to_jqgrid_json([:id, :pac_nome, :pac_fone, :pac_celular], 
        params[:page], params[:rows], lista.size) }
    end
  end
  
  # GET /pacientes/1
  # GET /pacientes/1.xml
  def show
    redirect_to(:controller => :pacientes, :action => :index)
    
    #@paciente = Paciente.find(params[:id])
    
    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.xml  { render :xml => @paciente }
    #  format.js { render :json => @paciente.to_json }
    #end
  end
  
  # GET /pacientes/new
  # GET /pacientes/new.xml
  def new
    @paciente = Paciente.new
    
    respond_to do |format|
      format.html # new.html.erb
      #format.xml  { render :xml => @paciente }
      format.js { render :paciente => @paciente}
    end
  end
  
  # GET /pacientes/1/edit
  def edit
    @paciente = Paciente.find(params[:id])
  end
  
  # POST /pacientes
  # POST /pacientes.xml
  def create
    @paciente = Paciente.new(params[:paciente])
    @paciente.clinica_id = session[:clinica_id]
    
    respond_to do |format|
      if @paciente.save
        format.html { redirect_to(@paciente, :notice => 'Paciente was successfully created.') }
        format.xml  { render :xml => @paciente, :status => :created, :location => @paciente }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @paciente.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /pacientes/1
  # PUT /pacientes/1.xml
  def update
    @paciente = Paciente.find(params[:id])
    
    respond_to do |format|
      if @paciente.update_attributes(params[:paciente])
        format.html { redirect_to(@paciente, :notice => 'Paciente was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @paciente.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /pacientes/1
  # DELETE /pacientes/1.xml
  def destroy
    @paciente = Paciente.find(params[:id])
    @paciente.destroy
    
    respond_to do |format|
      format.html { redirect_to(pacientes_url) }
      format.xml  { head :ok }
    end
  end
  
  def odontograma
    
  end
end
