class OdontogramadetController < ApplicationController
  def create
    @det = Odontogramadet.new
    @det.odd_dente = params[:dente]
    @det.odd_acao = params[:acao]
    @det.odontograma_id = 1
    @det.save
    redirect_to(:controller => :odontograma, :action => :index)
  end
end
