class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.date :suscribe_at
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps
    end
    add_foreign_key :attendances, :users, column: :user_id
    add_foreign_key :attendances, :events, column: :event_id
  end
end
