require 'airbrake-ruby'

# Every Airbrake notifier must configure
# two options: `project_id` and `project_key`.
Airbrake.configure do |c|
  c.project_id = 201874
  c.project_key = '8a1ebfd3f8a3887ef880c4c8d0e443d3'
end

namespace :rake_sample do
  desc "rake_sample"
  task :sample do
    begin
      1/0
    rescue ZeroDivisionError => ex
      # Return value is always `nil`.
      params = { time: Time.now }

      Airbrake.notify('AAAAAAops!', params,)

      #Airbrake.notify("testエラー発生", parameters: { ids: "aaaaaa" })
      #Airbrake.notify('Oops', this_will_be: 'prepended to the Params tab')
      #Airbrake.notify('abcdeg', order_id: "ssssss")
        #Airbrake.notify("倉庫サービス利用料の課金処理でエラー発生")
    end
  end
end
