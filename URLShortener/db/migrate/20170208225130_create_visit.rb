class CreateVisit < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :user_id, null: false
      t.integer :url_id, null: false
    end
  end
end