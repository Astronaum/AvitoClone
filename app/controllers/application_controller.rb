class ApplicationController < ActionController::Base
  helper_method :current_utilisateur

  private

  def current_utilisateur
    @current_utilisateur ||= Utilisateur.find_by(id: session[:utilisateur_id])
  end

end
