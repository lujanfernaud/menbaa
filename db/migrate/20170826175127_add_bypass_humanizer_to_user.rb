class AddBypassHumanizerToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bypass_humanizer, :boolean, default: false
  end
end
