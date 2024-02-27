class Utilisateur < ApplicationRecord

  has_many :favoris
  has_many :annonces, dependent: :destroy
  #pour supprimer tout les articles qd l user est supp
  validates :nom, presence: true, length: {maximum: 50} #presence du nom est obligatoire
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL}

  validates :telephone, presence: true, length: {minimum: 10}

  validates :password, presence: true, length: {minimum: 6}

  has_secure_password
end

