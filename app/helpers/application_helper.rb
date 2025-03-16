module ApplicationHelper
  def flash_background_color(type)
    case type.to_sym
    when :success then "bg-green-500"
    when :danger  then "bg-red-500"
    when :error  then "bg-yellow-500"
    else "bg-gray-500"
    end
  end

  def formatted_time(time, is_end_time: false)
    hour = time.hour
    adjusted_hour = hour < 5 ? hour + 24 : hour
    adjusted_hour = 29 if is_end_time && hour == 5
    "#{adjusted_hour}:#{time.strftime('%M')}"
  end
end
