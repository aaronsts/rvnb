class ChangeAvailableInListings < ActiveRecord::Migration[6.0]
  def change
    change_column_default :listings, :available, from: nil, to: true
  end
end
