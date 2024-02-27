class UtilisateursController < ApplicationController
  def index
    @utilisateurs = Utilisateur.all
  end

  def new
    @titre = "Créer un compte"
    @utilisateur = Utilisateur.new
  end

  def show
    @utilisateur = Utilisateur.find(params[:id])
  end

  def create
    @utilisateur = Utilisateur.new(utilisateur_params)
    if @utilisateur.save
      flash[:alert] = "Bienvenue!"
      session[:utilisateur_id] = @utilisateur.id
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @utilisateur = Utilisateur.find(params[:id])
    if @utilisateur.update(utilisateur_params)
      flash[:alert] = "Profil modifié avec succés"
      redirect_to root_path
    else
      render :update
    end
  end

  def login
    @utilisateur = Utilisateur.find_by(email: params[:email])
    if @utilisateur && @utilisateur.authenticate(params[:password])
      session[:user_id] = @utilisateur.id
    else
      flash[:error] = "Invalid email or password"
      render :new
    end
  end

  def logout
    session.clear
    redirect_to login_path
  end

  private
  def utilisateur_params
    params.require(:utilisateur).permit(:nom, :email, :telephone, :password, :password_confirmation)
  end

end
