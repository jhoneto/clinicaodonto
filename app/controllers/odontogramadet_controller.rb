class OdontogramadetController < ApplicationController
  def create
    @det = Odontogramadet.new
    @det.odd_dente = params[:dente]
    @det.procedimento_id = params[:acao]
    @det.odontograma_id = session[:odontogramaid]
    @det.odd_data = DateTime.now
    @det.save
    redirect_to(:controller => :odontograma, :action => :index)
  end
end
