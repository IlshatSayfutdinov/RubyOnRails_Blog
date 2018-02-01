class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
	  t.integer :commentable_id
      t.string  :commentable_type

      t.timestamps
    end
	  add_index :pictures, [:imageable_type, :imageable_id]
  end
end
