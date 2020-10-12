class Task < ApplicationRecord
  validates :title,  presence: true
  validates :task_limit_on, presence: true
  validates :task_status, presence: true
end
