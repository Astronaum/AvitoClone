class FavorisController < ApplicationController

  def index
    @favoris = Favori.all
  end

  def create
    @favori = Favori.new(utilisateur_id: current_utilisateur.id, annonce_id: params[:annonce_id])

    if @favori.save
      redirect_to root_path, notice: "Annonce added to favorites."
    else
      redirect_to @favori.annonce, alert: "An error occurred while adding the annonce to favorites."
    end
  end

  def destroy
    @favori = Favori.find(params[:id])
    @favori.destroy
    redirect_to mesfavoris_path
  end


end
