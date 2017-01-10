class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :destination_code
      t.string :price
      t.datetime :departure
      t.datetime :return
      t.string :url
      t.boolean :featured, default: false
    end
  end
end
