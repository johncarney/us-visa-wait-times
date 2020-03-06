class Consulate < ApplicationRecord
  has_many :appointment_wait_times, class_name: "AppointmentWaitTimes", dependent: :destroy

  validates :code, presence: true
  validates :name, presence: true, uniqueness: { scope: :code, case_sensitive: false }
end
