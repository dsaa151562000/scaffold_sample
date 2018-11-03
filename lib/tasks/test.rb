class Tasks::Test
  def self.execute
    begin
      p 'Test'
      1/0
    rescue ZeroDivisionError => ex
      params = { email: 'john@example.com', password:'1234567'}
      Airbrake.notify('runnerの例外だ!!', params)
    end
  end
end