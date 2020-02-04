#Problem 1
for(i in 1:7) {
  print(i^3)
}
#Problem 2
set.seed(14)
test.sum = TRUE
save.count = 0
for (i in 1:1000) {
  dice.rolls <- sample(1:6,2,replace=TRUE)
  save.count = i
  print(dice.rolls)
  sum.dice <- sum(dice.rolls)
  if(sum.dice>=8 & sum.dice<=12 & test.sum == TRUE) {
    print("end")
    break
  }
  if(i==1) {
    test.sum = FALSE
  }
  if(i!=1 & test.sum==FALSE) {
    #if(dice.rolls[1]==2 | dice.rolls[1]==6 | dice.rolls[2]==2 | dice.rolls[2]==6) {
    #  break
    #}
    if(sum(dice.rolls)==2 | sum(dice.rolls)==6) {
      break
    }
  }
}
print(save.count*2)

