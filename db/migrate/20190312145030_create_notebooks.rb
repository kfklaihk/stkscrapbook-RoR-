class CreateNotebooks < ActiveRecord::Migration[5.2]
  def change
    create_table :notebooks do |t|
      t.string :userid
      t.string :stkcode
      t.string :datme
      t.string :category
      t.string :fmt
      t.string :fileurl

      t.timestamps
    end
  end
end
