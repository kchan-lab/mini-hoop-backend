class CreateParents < ActiveRecord::Migration[8.1]
  def change
    create_table :parents do |t|
      t.string :name, limit: 100, null: false, comment: "保護者名"
      t.string :line_user_id, null: false, comment: "LINEユーザーID"
      t.timestamps
    end

    add_index :parents, :line_user_id, unique: true
  end
end
