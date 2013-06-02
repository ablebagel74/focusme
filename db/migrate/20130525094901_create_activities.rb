class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :task
      t.integer :times

      t.timestamps
    end
  end
end
