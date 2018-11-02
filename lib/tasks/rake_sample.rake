namespace :rake_sample do
  desc "rake_sample"
  task :sample do
    begin
      1/0
    rescue ZeroDivisionError => ex
      # Return value is always `nil`.
      params = { time: Time.now }

      Airbrake.notify('Oops!', params,)

      #Airbrake.notify("testエラー発生", parameters: { ids: "aaaaaa" })
      #Airbrake.notify('Oops', this_will_be: 'prepended to the Params tab')
      #Airbrake.notify('abcdeg', order_id: "ssssss")
        #Airbrake.notify("倉庫サービス利用料の課金処理でエラー発生")
    end
  end
end
