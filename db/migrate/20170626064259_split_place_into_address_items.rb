class SplitPlaceIntoAddressItems < ActiveRecord::Migration[5.1]
  def change
    change_table :events do |t|
      t.remove :place
      t.column :address,  :string
      t.column :postcode, :string
      t.column :city,     :string
      t.column :country,  :string
    end
  end
end
