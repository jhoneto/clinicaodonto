class UsuariosController < ApplicationController
  def new
    @usuario = Usuario.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @usuario }
    end
  end
  
  def create
    valores = params[:usuario]
    @usuario = Usuario.new(params[:usuario])
    @clinica = Clinica.new
    @clinica.cli_nome = valores[:clinica_id]
    @clinica.save
    @usuario.clinica_id = @clinica.id
    
    respond_to do |format|
      if @usuario.save
        format.html { redirect_to(@usuario, :notice => 'Usuario was successfully created.') }
        format.xml  { render :xml => @usuario, :status => :created, :location => @usuario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end
end 
