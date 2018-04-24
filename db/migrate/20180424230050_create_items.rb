class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :body
      t.references :user
      t.boolean :published
      t.boolean :private

      t.timestamps
    end
  end
end
