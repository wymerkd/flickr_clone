class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string "name"
      t.integer "photo_id"
    end
  end
end
