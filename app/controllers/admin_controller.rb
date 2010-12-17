require('digest/sha2')
class AdminController < ApplicationController
  def index
    
  end
  
  def login
    if request.get?
      session[:usuario_nome] = nil
      session[:usuario_id] = nil
      session[:clinica_id] = nil
      @usuario = Usuario.new
    else
      @usuario = Usuario.new(params[:usuario])
      dados = Usuario.find(:first, :conditions => [" usu_login = ? and usu_senha = ? and clinica_id = ?", @usuario.usu_login, Digest::SHA256.hexdigest(@usuario.usu_senha), @usuario.clinica_id])
      if dados
        session[:usuario_nome] = dados.usu_nome
        session[:usuario_id] = dados.id
        session[:clinica_id] = dados.clinica_id
        redirect_to(:controller => :home, :action => :index)
      else
        #flash[:aviso] = "Dados inválidos"
      end
    end
  end
  
  
  
end
