users = User.create(
  [
    {
      email: 'test@test.com',
      name: 'テスト',
      password: '11111111',
      password_confirmation: '11111111'
    },
    {
      email: "admin@admin.com",
      name:  "管理者",
      password:  "00000000",
      password_confirmation: "00000000",
      admin: true
    },
    {
      email: 'test2@test2.com',
      name: 'テスト2',
      password: '22222222',
      password_confirmation: '22222222'
    },
    {
      email: "test3@test3.com",
      name:  "テスト3",
      password:  "33333333",
      password_confirmation: "33333333",
    },
    {
      email: 'test4@test4.com',
      name: 'テスト4',
      password: '44444444',
      password_confirmation: '44444444'
    },
    {
      email: "test5@test5.com",
      name:  "テスト5",
      password:  "55555555",
      password_confirmation: "55555555",
    },
    {
      email: 'test6@test6.com',
      name: 'テスト6',
      password: '66666666',
      password_confirmation: '66666666'
    },
    {
      email: "test7@test7.com",
      name:  "テスト7",
      password:  "77777777",
      password_confirmation: "77777777",
    },
    {
      email: 'test8@test8.com',
      name: 'テスト8',
      password: '88888888',
      password_confirmation: '88888888'
    },
    {
      email: "test9@test9.com",
      name:  "テスト9",
      password:  "99999999",
      password_confirmation: "99999999",
    }
  ]
)
puts users
Label.create(name:'新規' )
Label.create(name:'リピート' )
Label.create(name:'修理' )
Label.create(name:'返品' )
Label.create(name:'追加' )
Label.create(name:'部品' )
Label.create(name:'転送' )
Label.create(name:'値引' )
Label.create(name:'現地確認' )
Label.create(name:'危険物' )


Task.create!(
  [
    {
      title: 'ドライポンプ',
      task_limit_on: '2020-01-01',
      task_status: '未着手',
      priority: '低',
      user_id: users[0].id
    },
    {
      title: 'ターボ分子ポンプ',
      task_limit_on: '2020-02-02',
      task_status: '未着手',
      priority: '中',
      user_id: users[1].id
    },
    {
      title: '油回転真空ポンプ',
      task_limit_on: '2020-03-03',
      task_status: '着手中',
      priority: '高',
      user_id: users[2].id
    },
    {
      title: 'メカニカルプースターポンプ',
      task_limit_on: '2020-04-04',
      task_status: '完了',
      priority: '低',
      user_id: users[3].id
    },
    {
      title: 'クライオポンプ',
      task_limit_on: '2020-05-05',
      task_status: '着手中',
      priority: '中',
      user_id: users[1].id
    },
    {
      title: 'スパッタイオンポンプ',
      task_limit_on: '2020-06-06',
      task_status: '着手中',
      priority: '高',
      user_id: users[0].id
    },
    {
      title: '電離真空系',
      task_limit_on: '2020-07-07',
      task_status: '未着手',
      priority: '低',
      user_id: users[7].id
    },
    {
      title: 'ピラニ真空系',
      task_limit_on: '2020-08-08',
      task_status: '完了',
      priority: '中',
      user_id: users[5].id
    },
    {
      title: '蒸着装置',
      task_limit_on: '2020-09-09',
      task_status: '未着手',
      priority: '高',
      user_id: users[8].id
    },
    {
      title: 'スパッタ装置',
      task_limit_on: '2020-10-10',
      task_status: '着手中',
      priority: '高',
      user_id: users[0].id
    }
  ]
)
