FactoryBot.define do
  factory :label do
    name {'新規'}
  end

  factory :label2, class: Label do
    name {'リピート'}
  end

  factory :label3, class: Label do
    name {'修理'}
  end
end
