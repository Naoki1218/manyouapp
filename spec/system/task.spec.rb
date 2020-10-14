require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    @task = FactoryBot.create(:task, title: 'task')
    @task = FactoryBot.create(:second_task, title: 'task2')
  end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path

        fill_in 'task[title]',with: 'task'
        fill_in 'task[task_limit_on]',with: '2020-12-12'
        fill_in 'task[task_status]',with: '済'
        click_button 'commit'
        expect(page).to have_content 'task'
        expect(page).to have_content '2020-12-12'
        expect(page).to have_content '済'
        # expect(page).to have_content 'task_failure'
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
