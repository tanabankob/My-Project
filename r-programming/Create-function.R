# Add to nums()
add_two_num <- function(num1,num2) {
  num1 + num2
}

# cube()_function
cube <- function(base , power=3) {
  total <- ( base ** power)
  return(total)
}

# count_ball_fucntion
balls <- c("red","red","green","blue","blue","green",
           "red", "green", "blue", "red", "green", "blue"
           ,"blue","blue","green")

count_ball <- function(balls,color) {
  sum(balls==color)
}
