class CreateConsulates < ActiveRecord::Migration[5.2]
  def change
    enable_extension :citext

    create_table :consulates do |t|
      t.citext :name, null: false
      t.citext :code, null: false

      t.timestamps

      t.index %i[ code name ], unique: true
    end
  end
end
