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

  def transport_mode_show(transport_mode)
    if transport_mode == 1
        "皆可"
      elsif transport_mode == 2
        "共乘 油錢分擔"
      elsif transport_mode == 3
        "包車"
      else
        "大眾運輸"
    end
  end

   def transport_mode_select
    options_for_select([["皆可", "1"],["共乘 油錢分擔", "2"],["包車", "3"],["大眾運輸", "4"]])
  end 

  def fee_mode_show(fee_mode)
    if fee_mode == 1
        "皆可"
      elsif fee_mode == 2
        "預先收費，不退不補"
      elsif fee_mode == 3
        "預先收費，多退少補"
      else 
        "結算後均攤"
    end
  end

   def fee_mode_select
    options_for_select([["皆可", "1"],["預先收費，不退不補", "2"],["預先收費，多退少補", "3"],["結算後均攤", "4"]])
  end 

  def food_mode_show(food_mode)
    if food_mode == 1
        "皆可"
      elsif food_mode == 2
        "公糧公炊 費用分擔"
      else
        "包餐"
    end
  end

   def food_mode_select
    options_for_select([["皆可", "1"],["公糧公炊 費用分擔", "2"],["包餐", "3"]])
  end 

end