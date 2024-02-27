module CategorieHelper
  def categories_options
    [
      ["Voyez choisir une catégorie", nil],
      ["Market", "MKT"],
      ["Véhicule", "VHL"],
      ["Immobilier", "IMM"],
      ["Entreprise", "ENT"],
    # Add more categories as needed
    ]
  end
end
