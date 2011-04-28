class ConsultasController < ApplicationController
  layout "padrao"
  
  def new
    agora = Time.new
    agora = agora - 10800
    @consulta = Consulta.new(:con_datahoraini => agora, :con_datahorafim => (agora + 3600))
  end
  
  def create
    dtinicial = DateTime.civil(params[:consulta][:"con_datahoraini(1i)"].to_i, params[:consulta][:"con_datahoraini(2i)"].to_i, params[:consulta][:"con_datahoraini(3i)"].to_i, params[:consulta][:"con_datahoraini(4i)"].to_i, params[:consulta][:"con_datahoraini(5i)"].to_i)
    dtfinal = DateTime.civil(params[:consulta][:"con_datahorafim(1i)"].to_i, params[:consulta][:"con_datahorafim(2i)"].to_i, params[:consulta][:"con_datahorafim(3i)"].to_i, params[:consulta][:"con_datahorafim(4i)"].to_i, params[:consulta][:"con_datahorafim(5i)"].to_i)
    @consulta = Consulta.new()
    @consulta.con_paciente = params[:consulta][:con_paciente]
    @consulta.con_desc = params[:consulta][:con_desc]
    @consulta.con_fone = params[:consulta][:con_fone]
    @consulta.con_status = 1 #Agendado      
    @consulta.con_datahoraini = dtinicial
    @consulta.con_datahorafim = dtfinal
    @consulta.save
  end
  
  def index
    
  end
  
  
  def get_events
    @consultas = Consulta.find(:all)
    events = [] 
    @consultas.each do |consulta|
      titulo = consulta.con_paciente
      if consulta.con_fone
        titulo = titulo + " - " + consulta.con_fone
      end
      events << {:id => consulta.id, :title => titulo, :description => consulta.con_desc , :start => "#{consulta.con_datahoraini.iso8601}", :end => "#{consulta.con_datahorafim.iso8601}", :allDay =>false}
    end
    render :text => events.to_json
  end
  
  
  
  def move
    @consulta = Event.find_by_id params[:id]
    if @consulta
      @consulta.starttime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@consulta.starttime))
      @consulta.endtime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@consulta.endtime))
      @consulta.all_day = params[:all_day]
      @consulta.save
    end
  end
  
  
  def resize
    @consulta = Event.find_by_id params[:id]
    if @consulta
      @consulta.endtime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@consulta.endtime))
      @consulta.save
    end    
  end
  
  def edit
    @consulta = Consulta.find_by_id(params[:id])
  end
  
  def update    
    @consulta = Consulta.find_by_id(params[:consulta][:id])
    #@event = params[:consulta][]
    #@consulta.attributes = @event
    dtinicial = DateTime.civil(params[:consulta][:"con_datahoraini(1i)"].to_i, params[:consulta][:"con_datahoraini(2i)"].to_i, params[:consulta][:"con_datahoraini(3i)"].to_i, params[:consulta][:"con_datahoraini(4i)"].to_i, params[:consulta][:"con_datahoraini(5i)"].to_i)
    dtfinal = DateTime.civil(params[:consulta][:"con_datahorafim(1i)"].to_i, params[:consulta][:"con_datahorafim(2i)"].to_i, params[:consulta][:"con_datahorafim(3i)"].to_i, params[:consulta][:"con_datahorafim(4i)"].to_i, params[:consulta][:"con_datahorafim(5i)"].to_i)
    @consulta.con_desc = params[:consulta][:con_desc] 
    @consulta.con_paciente = params[:consulta][:con_paciente]
    @consulta.con_fone = params[:consulta][:con_fone]
    @consulta.con_datahorafim = dtfinal
    @consulta.con_datahoraini = dtinicial
    @consulta.save
    render :update do |page|
      page<<"$('#calendar').fullCalendar( 'refetchEvents' )"
      page<<"$('#desc_dialog').dialog('destroy')" 
    end
    
  end  
  
  def destroy
    @consulta = Event.find_by_id(params[:id])
    if params[:delete_all] == 'true'
      @consulta.event_series.destroy
    elsif params[:delete_all] == 'future'
      @consultas = @consulta.event_series.events.find(:all, :conditions => ["starttime > '#{@consulta.starttime.to_formatted_s(:db)}' "])
      @consulta.event_series.events.delete(@consultas)
    else
      @consulta.destroy
    end
    
    render :update do |page|
      page<<"$('#calendar').fullCalendar( 'refetchEvents' )"
      page<<"$('#desc_dialog').dialog('destroy')" 
    end
    
  end
  
end
