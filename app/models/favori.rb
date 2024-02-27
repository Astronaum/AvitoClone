class Favori < ApplicationRecord
  belongs_to :utilisateur
  belongs_to :annonce
end
