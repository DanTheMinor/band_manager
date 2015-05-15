class CreateTableVenues < ActiveRecord::Migration
  def change
    create_table(:venues) do |t|
      t.column(:description, :string)
      t.timestamps()
    end
  end
end
