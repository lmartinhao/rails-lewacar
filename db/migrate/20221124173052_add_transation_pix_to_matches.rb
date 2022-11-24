class AddTransationPixToMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :transaction_pix, :string
  end
end
