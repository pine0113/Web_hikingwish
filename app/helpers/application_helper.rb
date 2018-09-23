module ApplicationHelper
  def jiggle
    'I can jiggle'
  end

  def howmanydays(numberofday_id)
    if numberofday_id == 1
        "一天一夜"
      elsif numberofday_id == 2
        "兩天一夜"
      elsif numberofday_id == 3
        "兩天兩夜"
      elsif numberofday_id == 4
        "三天兩夜"
      elsif numberofday_id == 5
        "三天三夜"
      elsif numberofday_id == 6
        "四天三夜"
      elsif numberofday_id == 7
        "四天四夜"
      elsif numberofday_id == 8
        "五天四夜"
      elsif numberofday_id == 9
        "五天四夜"
      else
        "不限"
    end
  end

  def howmanydays_select
    [["一天一夜", "1"],["兩天一夜", "2"],["兩天兩夜", "3"],["三天兩夜", "4"],
      ["三天三夜", "5"],["四天三夜", "6"],["四天四夜", "7"],["五天四夜", "8"],["五天四夜", "9"],
      ["不限", "10"]]
  end

end

