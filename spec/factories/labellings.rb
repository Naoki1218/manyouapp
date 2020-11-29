FactoryBot.define do
  factory :labelling do
    task 
    label

    # trait :with_tasks do
    #   after(:create) do |label|
    #     task = FactoryBot.create(:task, :second_task)
    #     create_list(:label, 1, tasks: [task], task: task)
    #   end
    # end
  end
end
