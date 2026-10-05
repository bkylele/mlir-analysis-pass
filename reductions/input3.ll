; A subtraction whose operands are abstracted as One and Positive.
define i32 @sub_nonpositive() {
  %result = sub i32 1, 5
  ret i32 %result
}
