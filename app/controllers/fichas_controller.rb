class FichasController < ApplicationController
  before_filter :usuario_autenticado?
  layout "padrao"
  # GET /fichas
  # GET /fichas.xml
  def index
    @pacienteId = params[:pacienteid]
    @paciente = Paciente.find(@pacienteId)
    @fichas = Ficha.find(:all,
                         :conditions => ["paciente_id = ?", @pacienteId])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fichas }
    end
  end

  # GET /fichas/1
  # GET /fichas/1.xml
  def show
    @ficha = Ficha.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ficha }
    end
  end

  # GET /fichas/new
  # GET /fichas/new.xml
  def new
    @ficha = Ficha.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ficha }
    end
  end

  # GET /fichas/1/edit
  def edit
    @ficha = Ficha.find(params[:id])
  end

  # POST /fichas
  # POST /fichas.xml
  def create
    @ficha = Ficha.new(params[:ficha])

    respond_to do |format|
      if @ficha.save
        format.html { redirect_to(@ficha, :notice => 'Ficha was successfully created.') }
        format.xml  { render :xml => @ficha, :status => :created, :location => @ficha }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ficha.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fichas/1
  # PUT /fichas/1.xml
  def update
    @ficha = Ficha.find(params[:id])

    respond_to do |format|
      if @ficha.update_attributes(params[:ficha])
        format.html { redirect_to(@ficha, :notice => 'Ficha was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ficha.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fichas/1
  # DELETE /fichas/1.xml
  def destroy
    @ficha = Ficha.find(params[:id])
    @ficha.destroy

    respond_to do |format|
      format.html { redirect_to(fichas_url) }
      format.xml  { head :ok }
    end
  end
end
