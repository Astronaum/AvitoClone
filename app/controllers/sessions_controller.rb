class SessionsController < ApplicationController
  def new
    @titre = "Login"
  end



  def create
    utilisateur = Utilisateur.find_by(email: params[:email])
    if utilisateur.present? && utilisateur.authenticate(params[:password])
      session[:utilisateur_id] = utilisateur.id
      redirect_to root_path, notice: "Connecté"
    else
      flash[:alert] = "Combinaison Email ou Mot de passe invalide"
      render :new
    end
  end
  def destroy
    session.delete(:utilisateur_id)
    session[:utilisateur_id] = nil
    redirect_to root_path, notice: "Déconnecté"
  end
end
