class AddEmployerIdToPosts < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :employer_id, :integer
  end
end
