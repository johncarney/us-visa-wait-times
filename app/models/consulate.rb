class Consulate < ApplicationRecord
  validates :code, presence: true
  validates :name, presence: true, uniqueness: { scope: :code, case_sensitive: false }
end
