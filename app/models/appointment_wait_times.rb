class AppointmentWaitTimes < ApplicationRecord
  CATEGORIES = %i[
    visitor
    student_exchange_visitor,
    other_non_immigrant
  ]

  belongs_to :consulate, inverse_of: :appointment_wait_times

  validates :consulate, presence: true
end
