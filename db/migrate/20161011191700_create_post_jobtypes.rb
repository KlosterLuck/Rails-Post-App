class CreatePostJobtypes < ActiveRecord::Migration[5.0]
  def change
    create_table :post_jobtypes do |t|
    	t.integer :post_id
    	t.integer :jobtype_id
    	t.timestamps
    end
  end
end