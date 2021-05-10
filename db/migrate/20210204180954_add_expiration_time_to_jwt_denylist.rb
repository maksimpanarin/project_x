class AddExpirationTimeToJwtDenylist < ActiveRecord::Migration[6.1]
  def change
    add_column :jwt_blacklist, :exp, :datetime, null: false
  end
end
