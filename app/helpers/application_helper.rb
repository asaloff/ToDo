module ApplicationHelper
  def display_priority(obj)
    case obj.priority
    when 1
      'HIGH'
    when 2
      'Medium'
    else
      "low"
    end
  end

  def priority_color(obj)
    case obj.priority
    when 1
      'red'
    when 2
      'orange'
    else
      "green"
    end 
  end
end
