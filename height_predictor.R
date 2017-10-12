predict_height <- function(sex,
                           dad_height,
                           mom_height) {
  total_height = dad_height + mom_height
  if ( sex = "M") {
    total_height = total_height + 5
  } else {
    total_height = total_height -5
  }
  return total_height/2
  predict_height <- function(sex, dad_height, mom_height) {
    tot_height <- dad_height + mom_height
    if (sex == "") {
      tot_heigh <- tot_height + 5
    } else {
      tot_height <- tot_height - 5
    }
    return tot_height/2
  }
  
}
