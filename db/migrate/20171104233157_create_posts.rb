class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.timestamps
    end

    create_table :posts do |t|
      t.string :image_url
      t.string :caption
      t.belongs_to :user
      t.timestamps
    end

    create_table :comments do |t|
      t.belongs_to :post
      t.string :body
    end  
  end
end
