class CreateJobtypes < ActiveRecord::Migration[5.0]
  def change
    create_table :jobtypes do |t|
    	t.string :name
    	
    	t.timestamps
    end
  end
end
