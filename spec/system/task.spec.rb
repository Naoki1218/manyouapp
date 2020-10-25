require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    @task = FactoryBot.create(:task, title: 'task1')
    @task = FactoryBot.create(:second_task, title: 'task2')
  end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path

        fill_in 'task[title]',with: 'task1'
        select '未着手',from: 'task[task_status]'
        click_button 'commit'
        expect(page).to have_content 'task1'
        expect(page).to have_content '2020'
        expect(page).to have_content '11'
        expect(page).to have_content '12'
        expect(page).to have_content '未着手'
        # expect(page).to have_content 'task_failure'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        # ここに実装する
        visit tasks_path

        task_list = all('tbody tr')
        expect(task_list[0]).to have_content 'task2'
        expect(task_list[1]).to have_content 'task1'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        # task = FactoryBot.create(:task, title: 'task')

        visit tasks_path

        expect(page).to have_content 'task'
      end
    end
    context 'タスク終了期限でソートした場合' do
      it '終了期限降順で表示される' do
        # ここに実装する
        visit tasks_path

        click_on '終了期限でソートする'
        task_list = all('tbody tr')
        expect(task_list[0]).to have_content '2020-12-22'
        expect(task_list[1]).to have_content '2020-11-12'
      end
    end
  end
  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        # @task = FactoryBot.create(:task, title: 'task')

        visit task_path(@task)

        expect(page).to have_content 'task'
      end
    end
  end
end
