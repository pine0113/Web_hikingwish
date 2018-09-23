class HikingWishFormBuilder < ActionView::Helpers::FormBuilder
  def howmanydays_select(numberofday_id)
    options_for_select([["select1", "1"],["select2", "2"],["select3", "3"],["select4", "4"],
      ["select5", "5"],["select6", "6"],["select7", "7"],["select8", "8"],["select9", "9"],
      ["select10", "10"]])

  end
end