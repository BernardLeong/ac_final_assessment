class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.references :follower , null: false , references: :users
      t.references :following , null: false , references: :users

      t.timestamps
    end
    add_foreign_key :follows, :users, column: :follower_id
    add_foreign_key :follows, :users, column: :following_id
    add_index :follows , [:follower_id , :following_id] , unique: true
  end
end
