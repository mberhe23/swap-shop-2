class CreateSwaps < ActiveRecord::Migration[7.0]
  def change
    create_table :swaps do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
