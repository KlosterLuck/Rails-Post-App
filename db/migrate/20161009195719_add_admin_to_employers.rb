class AddAdminToEmployers < ActiveRecord::Migration[5.0]
  def change
	add_column :employers, :admin, :boolean, default: false
  end
end
