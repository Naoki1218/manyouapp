User
|  column             |  data  |
| ------------------- | ------ |
| name                | string |
| password_digest     | string |
| email               | string |

Task
|  column             |  data  |
| ------------------- | ------ |
| title               | string |
| user_id             | bigint |
| task_limit_on       | date   |
| task_status         | integer| (enum)

Label
|  column             |  data  |
| ------------------- | ------ |
| task_id             | bigint |
| name                | string |

|Herokuへのデプロイ方法                                    |
| ------------------------------------------------------ |
|1.アセットプリコンパイルをする                              |
| :$ rails assets:precompile RAILS_ENV=production       |
| ----------------------------------------------------- |
|2.コミットする                                           |
| :~/workspace/manyouapp (master) $ git add -A          |
| :~/workspace/manyouapp (master) $ git commit -m "init"|
| ----------------------------------------------------- |
|3.Herokuに新しいアプリケーションを作成                      |
| :$ heroku create                                      |
| ----------------------------------------------------- |
|4.Herokuにデプロイをする                                  |
| :$ git push heroku master                             |
