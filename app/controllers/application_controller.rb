# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :correct_safari_and_ie_accept_headers
  after_filter :set_xhr_flash
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def usuario_autenticado?
    if not session[:usuario_id]
      #flash[:importante] = "Por favor efetue login"
      redirect_to(:controller=> :admin, :action=>:index)
      return false
    end
    return true
  end
  
  
  
  def set_xhr_flash
    flash.discard if request.xhr?
  end
  
  def correct_safari_and_ie_accept_headers
    ajax_request_types = ['text/javascript', 'application/json', 'text/xml']
    request.accepts.sort! { |x, y| ajax_request_types.include?(y.to_s) ? 1 : -1 } if request.xhr?
  end
  
  
end
