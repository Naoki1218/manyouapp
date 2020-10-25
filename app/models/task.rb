class Task < ApplicationRecord
  validates :title, presence: true
  validates :task_limit_on, presence: true
  validates :task_status, presence: true

  enum task_status: { 未着手: 0, 着手中: 1, 完了: 2 }
end
