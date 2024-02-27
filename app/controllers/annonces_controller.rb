class AnnoncesController < ApplicationController

  def index
    @titre = "Annonces"
    @annonces = Annonce.all
  end

  def new
    @titre = "Nouvel Annonce"
    @annonce = Annonce.new
  end

  def show
    @titre = "Détails d'annonce"
    @annonce = Annonce.find(params[:id])
  end

  def create
    @annonce = Annonce.new(annonce_params)
    @annonce.utilisateur_id = session[:utilisateur_id]
    utilisateur = Utilisateur.find_by(id: session[:utilisateur_id])
    @annonce.telephone = utilisateur.telephone
    if @annonce.save
      if params[:annonce][:image].present?
        params[:annonce][:image].each do |image|
          @annonce.images.attach(image)
        end
      end
      flash[:alert] = "Annonce ajoutée"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @annonce = Annonce.find(params[:id])
  end

  def update
    @annonce = Annonce.find(params[:id])

    if params[:delete_image_ids]
      params[:delete_image_ids].each do |id|
        image = @annonce.images.find_by_id(id)
        image.purge if image
      end
    end

    if @annonce.update(annonce_params)
      if params[:annonce][:image].present?
        params[:annonce][:image].each do |image|
          @annonce.images.attach(image)
        end
      end
      flash[:alert] = "Annonce mise à jour"
      redirect_to mesannonces_path
    else
      render :update
    end
  end

  def search
    @titre = params[:titre]
    @categorie = params[:categorie]
    @ville = params[:ville]

    if @titre.present?
      @result = Annonce.where("titre LIKE ?", "%#{@titre}%")
    elsif @ville.present? && @categorie.present?
      @result = Annonce.where("categorie = ? AND ville = ?", "#{@categorie}", "#{@ville}")
    elsif @ville.present?
      @result = Annonce.where("ville = ?", "#{@ville}")
    elsif @categorie.present?
      @result = Annonce.where("categorie = ?", "#{@categorie}")
    else
      @result = Annonce.all
    end


    render 'search'
  end

  def destroy
    @annonce = Annonce.find(params[:id])
    @annonce.destroy
    #flash[:alert] = "Annonce supprimé"
    redirect_to mesannonces_path
  end

  def annonce_params
    params.require(:annonce).permit(:titre, :categorie, :ville, :prix, :etat, :description, :utilisateur_id, :telephone, :image)
  end

end
