require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'タスクモデル機能', type: :model do
    describe '検索機能' do
    # 必要に応じて、テストデータの内容を変更して構わない
    before do
      @user = FactoryBot.create(:user)
      @admin_user = FactoryBot.create(:admin_user)
      @task1 = FactoryBot.create(:task, title: 'task1', user: @user)
      @task2 = FactoryBot.create(:second_task, title: 'task2')
      @task3 = FactoryBot.create(:second_task, title: 'task3', user: @admin_user)
    end
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
        expect(Task.get_by_title('task1')).to include(@task1)
        expect(Task.get_by_title('task1')).not_to include(@task2)
        expect(Task.get_by_title('task1').count).to eq 1
      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        # ここに内容を記載する
        expect(Task.get_by_task_status('未着手')).to include(@task1)
        expect(Task.get_by_task_status('未着手')).not_to include(@task2)
        expect(Task.get_by_task_status('未着手').count).to eq 1
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        # ここに内容を記載する
        expect(Task.get_by_title('task1').get_by_task_status('未着手')).to include(@task1)
        expect(Task.get_by_title('task1').get_by_task_status('未着手')).not_to include(@task2)
        expect(Task.get_by_title('task1').get_by_task_status('未着手').count).to eq 1
      end
    end
  end
    describe 'バリデーションのテスト' do
      context 'タスクのタイトルが空の場合' do
        it 'バリデーションにひっかる' do

          task = Task.new(title: '', task_limit_on: '2020-12-12', task_status: '未着手')
          expect(task).not_to be_valid
        end
      end

      context 'タスクの期限が空の場合' do
        it 'バリデーションにひっかかる' do
          # ここに内容を記載する
          task = Task.new(title: 'task', task_limit_on: '', task_status: '未着手')
          expect(task).not_to be_valid
        end
      end

      context 'タスクのステイタスが空の場合' do
        it 'バリデーションにひっかかる' do
          # ここに内容を記載する
          task = Task.new(title: 'task', task_limit_on: '2020-12-12', task_status: '')
          expect(task).not_to be_valid
        end
      end

      context 'タスクのタイトルと期限とステイタスに内容が記載されている場合' do
        it 'バリデーションが通る' do

          task = Task.new(title: 'task', task_limit_on: '2020-12-12', task_status: '未着手')
          expect(task).to be_valid
        end
      end
    end
  end
end
