class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :description
      t.string :url
      t.datetime :due_date
      t.integer :target_num
      t.integer :product_id

      t.timestamps
    end
  end
end
