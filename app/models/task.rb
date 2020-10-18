class Task < ApplicationRecord
  validates :title, presence: true
  validates :task_limit_on, presence: true
  validates :task_status, presence: true

  # enum task_status: { 未: 0, 済: 1 }
end
