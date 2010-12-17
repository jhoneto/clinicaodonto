class DentistasController < ApplicationController
  before_filter :usuario_autenticado?
  layout "padrao"
  # GET /dentistas
  # GET /dentistas.xml
  def index
    @dentistas = Dentista.all(:all, :conditions => ["clinica_id = ?", session[:clinica_id]])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dentistas }
    end
  end

  # GET /dentistas/1
  # GET /dentistas/1.xml
  def show
    @dentista = Dentista.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dentista }
    end
  end

  # GET /dentistas/new
  # GET /dentistas/new.xml
  def new
    @dentista = Dentista.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dentista }
    end
  end

  # GET /dentistas/1/edit
  def edit
    @dentista = Dentista.find(params[:id])
  end

  # POST /dentistas
  # POST /dentistas.xml
  def create
    @dentista = Dentista.new(params[:dentista])
    @dentista.clinica_id = session[:clinica_id]

    respond_to do |format|
      if @dentista.save
        format.html { redirect_to(@dentista, :notice => 'Dentista was successfully created.') }
        format.xml  { render :xml => @dentista, :status => :created, :location => @dentista }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dentista.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dentistas/1
  # PUT /dentistas/1.xml
  def update
    @dentista = Dentista.find(params[:id])

    respond_to do |format|
      if @dentista.update_attributes(params[:dentista])
        format.html { redirect_to(@dentista, :notice => 'Dentista was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dentista.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dentistas/1
  # DELETE /dentistas/1.xml
  def destroy
    @dentista = Dentista.find(params[:id])
    @dentista.destroy

    respond_to do |format|
      format.html { redirect_to(dentistas_url) }
      format.xml  { head :ok }
    end
  end
end
