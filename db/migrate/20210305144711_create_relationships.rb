class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps

      #add_index :relationships, :follower_id
      #add_index :relationships, :followed_id
      #add_index :relationships, [:follower_id, :followed_id], unique: true # A user can't follow another more than once.

    end
  end
end
