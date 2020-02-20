class CreateItemImages < ActiveRecord::Migration[5.2]
  def change
    create_table :item_images do |t|
      t.string :image_url
      t.references :user, null:false, Fk:true
      t.timestamps
    end
  end
end
