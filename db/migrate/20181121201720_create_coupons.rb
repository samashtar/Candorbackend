class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :info
      t.integer :user_id
      t.timestamps
    end
  end
end
