class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :name

      t.timestamps
    end

    create_table :posts do |t|
    t.belongs_to :user, index: true
    t.timestamps 
    end

  end
end
