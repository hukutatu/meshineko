p '==================== dish create ===================='
dish_names = ["鮭飯","中華ちまき","リゾット","五目炊き込みご飯（釜飯）","栗ご飯","きのこご飯","タケノコご飯","山菜おこわ","あさりご飯"
  ]
dish_names.each do |dish_name|
  Dish.create(
    dish_name:dish_name
  )
end