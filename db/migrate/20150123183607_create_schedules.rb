class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :hour

      t.timestamps
    end
  end
end
