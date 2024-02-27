class AddTelephoneToAnnonces < ActiveRecord::Migration[6.1]
  def change
    add_column :annonces, :telephone, :string
  end
end
