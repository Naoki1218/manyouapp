FactoryBot.define do
  factory :task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    title { 'task1' }
    task_limit_on { '2020-11-12' }
    task_status { '未着手' }
  end

  factory :second_task, class: Task do
    title { 'task2' }
    task_limit_on { '2020-12-22' }
    task_status { '未着手' }
  end
end
