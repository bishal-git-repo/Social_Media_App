# class AddUserIdToPosts < ActiveRecord::Migration[8.0]
#   def change
#     add_column :posts, :user_id, :integer
#     add_foreign_key :posts, :users
#   end
# end

class AddUserIdToPosts < ActiveRecord::Migration[8.0]
  def change
    unless column_exists?(:posts, :user_id)
      add_column :posts, :user_id, :bigint
    end

    unless foreign_key_exists?(:posts, :users)
      add_foreign_key :posts, :users
    end
  end
end
