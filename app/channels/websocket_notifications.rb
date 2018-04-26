class WebsocketNotifications < ApplicationCable::Channel
  #identified_by :current_user
  #def subscribed
#    self.current_user = find_verified_user
    #stream_from (params[:event])
  #end

#  protected
    # def find_verified_user
    #   session_token = cookies[Authenticate.configuration.cookie_name.to_sym]
    #   verified_user = Authenticate.configuration.user_model_class.where(session_token: session_token).first
    #   verified_user || reject_unauthorized_connection
    # end
end
