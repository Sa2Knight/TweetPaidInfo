class TouchOnTime
  SCRIPT_PATH   = '/root/TouchOnTimeChecker/main.py'.freeze

  def initialize(date)
    script_response = `python #{SCRIPT_PATH} #{date.day}`
    script_results  = script_response.strip.split(',')

    @total_over_time = script_results[0]
    @days_over_time  = script_results[1]
  end

  def total_over_time_str
    time_str(@total_over_time)
  end

  def days_over_time_str
    time_str(@days_over_time)
  end

  private
    def time_str(str)
      return '出勤情報なし' if str == '-'
      str = str.to_f
      str >= 0 ? "+#{str}時間" : "#{str}時間"
    end
end