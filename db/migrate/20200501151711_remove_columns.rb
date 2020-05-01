class RemoveColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :attendances, :suscribe_at
  end
end
