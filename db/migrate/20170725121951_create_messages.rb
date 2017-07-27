class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :author
      t.integer :receiver
      t.integer :user_id
      t.text :text

      t.timestamps
    end
  end
end
