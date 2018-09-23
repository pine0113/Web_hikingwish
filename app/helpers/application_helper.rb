module ApplicationHelper
  def jiggle
    'I can jiggle'
  end

  def howmanydays(numberofday_id)
    if numberofday_id == 1
        "1helper"
      elsif numberofday_id == 2
        "2helper"
      elsif numberofday_id == 3
        "3helper"
      elsif numberofday_id == 4
        "4helper"
      elsif numberofday_id == 5
        "5helper"
      elsif numberofday_id == 6
        "6helper"
      elsif numberofday_id == 7
        "7helper"
      elsif numberofday_id == 8
        "8helper"
      elsif numberofday_id == 9
        "9helper"
      else
        "10helper"
    end
  end
end

