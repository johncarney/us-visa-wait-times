class CreateAppointmentWaitTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :appointment_wait_times do |t|
      t.references :consulate,                null: false
      t.integer    :visitor,                  null: false, default: 0
      t.integer    :student_exchange_visitor, null: false, default: 0
      t.integer    :other_non_immigrant,      null: false, default: 0

      t.timestamps
    end

    add_foreign_key :appointment_wait_times, :consulates, on_delete: :cascade
  end
end
