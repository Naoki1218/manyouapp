FactoryBot.define do
  factory :task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    title { 'test_title' }
    task_limit_on { '2020-12-12' }
    task_status { '0' }
  end
end
