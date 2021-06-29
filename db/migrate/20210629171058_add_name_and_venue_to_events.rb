class AddNameAndVenueToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :name, :string
    add_column :events, :venue, :string
  end
end
