require 'date'

module ApplicationHelper
  def describe_date_relative(date)
    if !date
      return "undefined"
    end

    now = Time.now.to_date

    if(date == now)
      return 'today'
    end

    if(date == now - 1)
      return 'yesterday'
    end

    if(date == now + 1)
      return 'tomorrow'
    end

    if(date < now)
      return "#{(now - date).to_i} days ago"
    end

    if(date - now <= 6)
      return date.strftime('%A')
    end

    if(date - now < 13)
      return "next #{date.strftime('%A').downcase}"
    end

    return date.to_s
  end

end
