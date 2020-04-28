class AddEventsToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :user, polymorphic: true
  end
end
