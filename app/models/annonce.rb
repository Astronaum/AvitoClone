class Annonce < ApplicationRecord

     has_many_attached :images
     has_many :favoris
     belongs_to :utilisateur
     validates :utilisateur_id, presence: true
     validates :titre, presence: true, length: { maximum: 200 }
     validates :etat, presence: true
     validates :telephone, presence: true
     validates :categorie, presence: true

end
