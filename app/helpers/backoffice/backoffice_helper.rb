module Backoffice::BackofficeHelper
  
  def message_notices(noticer)
      noticer.errors.full_messages.each do |message| 
        if flash[:notice].nil?
          flash[:notice] = [message]
        else
          flash[:notice] << message
        end
      end
  end

end