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
    if(dice.rolls[1]==2 | dice.rolls[1]==6 | dice.rolls[2]==2 | dice.rolls[2]==6) {
      break
    }
  }
}
print(save.count)

#Problem 3
GSS<-read.csv("~/Downloads/GSS-data.csv")
vote.choice = function(x) {
  if(x=="Trump") {
    length(GSS$pres16[GSS$pres16=="Trump"])
  }
  else if(x=="Clinton") {
    length(GSS$pres16[GSS$pres16=="Clinton"])
  }
  else if(x=="Other") {
    length(GSS$pres16[GSS$pres16!="Trump" & GSS$pres16!="Clinton"])
  }
  else {
    print("Please enter either ‘Trump’ ‘Clinton’ or ‘Other’ into the functionto return a valid response")
  }
}

#Problem 4
install.packages('fivethirtyeight')
library(fivethirtyeight)
cabinet_turnover <- subset(cabinet_turnover,is.na(cabinet_turnover$days)==FALSE)
preslist <- c("Carter","Reagan","Bush 41","Clinton","Bush 43","Obama","Trump")
presdayslist <- c(1461,2922,1461,2922,2922,2922,1105)
presdays<-data.frame("presidents"=preslist,"days"=presdayslist)
appoint <- function(pres) {
  avgday.appointee<-mean(cabinet_turnover$days[cabinet_turnover$president==pres])
  daysinoffice<-presdays$days[presdays$presidents==pres]
  return(avgday.appointee/daysinoffice)
}

#Problem 5
congress_stats <- function(input) {
  if(input=="congress") {
    congress <- c(80:113)
    congressages<-c()
    for(i in congress) {
      avgage<-mean(congress_age$age[congress_age$congress==i])
      congressages<-c(congressages,avgage)
    }
    congress.ages.acc<-data.frame("Congress"=congress,"Average Age"=congressages)
    return(congress.ages.acc)
  }
  if(input=="state") {
    states <- unique(congress_age$state)
    congressages<-c()
    for(i in states) {
      avgage<-mean(congress_age$age[congress_age$state==i])
      congressages<-c(congressages,avgage)
    }
    state.ages.acc<-data.frame("State"=states,"Average Age"=congressages)
    return(state.ages.acc)
  }
}



