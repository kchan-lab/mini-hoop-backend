class CreateParents < ActiveRecord::Migration[8.1]
  def change
    create_table :parents do |t|
      t.string :name, null: false, comment: "保護者名"
      t.string :line_user_id, null: false, comment: "LINEユーザーID"
      t.timestamps
    end
  end
end
