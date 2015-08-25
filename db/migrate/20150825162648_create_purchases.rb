class CreatePurchases < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|
      t.column(:date, :timestamp)

      t.timestamps()
    end
  end
end
