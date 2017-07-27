class Keys < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :messages, :users
  end
end
