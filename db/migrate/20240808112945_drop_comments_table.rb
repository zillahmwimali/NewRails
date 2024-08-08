class DropCommentsTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :comments
  end

  def down
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
