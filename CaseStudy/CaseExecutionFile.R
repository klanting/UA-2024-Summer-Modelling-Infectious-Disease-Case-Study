setwd("~/Desktop/universiteit/InfectiousDisease/UA-2024-Summer-modelling-infectious-disease-case-syudy/lib")

source('ibm_functions.R')

### compare non vaccin with vaccin

#baseline default param (obs0)
run_ibm_location(rng_seed=200)

#vaccination uptake 0.01 (obs1)
v = run_ibm_location(rng_seed=200, vaccination_uptake = 0.01, add_baseline=T)
print(v)

run_ibm_location(vaccination_uptake = 0.01, add_baseline=T)

#vaccination uptake 0.02 (obs2)
v = run_ibm_location(rng_seed=200, vaccination_uptake = 0.02, add_baseline=T)
print(v)

# check difference between day 12 and 20

improved_counter1 = 0
improved_counter2 = 0
for (i in 1:200){
  print(i)
  log_r_orignal <- run_ibm_location(return_prevelance=TRUE, bool_show_demographics=FALSE)$log_i
  log_r_orignal_uptake1 <- run_ibm_location(vaccination_uptake = 0.01, return_prevelance=TRUE, bool_show_demographics=FALSE)$log_i
  log_r_orignal_uptake2 <- run_ibm_location(vaccination_uptake = 0.02, return_prevelance=TRUE, bool_show_demographics=FALSE)$log_i
  
  bool1 <- (log_r_orignal[12] > log_r_orignal_uptake1[12]) & (log_r_orignal[20] > log_r_orignal_uptake1[20])
  bool2 <- (log_r_orignal[12] > log_r_orignal_uptake2[12]) & (log_r_orignal[20] > log_r_orignal_uptake2[20])
  
  if (bool1){
    improved_counter1 <- improved_counter1 + 1
  }
  if (bool2){
    improved_counter2 <- improved_counter2 + 1
  }
}

print(improved_counter1)
print(improved_counter2)

#vaccination uptake 0.1 (obs3)
run_ibm_location(rng_seed=200, vaccination_uptake = 0.1, add_baseline=T)

#increase of population size

#pop size 10k (obs4) 
run_ibm_location(pop_size=5000, rng_seed=200)

#vaccination uptake 0.01 + pop size 10k (obs5) 
run_ibm_location(pop_size=5000, rng_seed=200, vaccination_uptake = 0.01)

#vaccination uptake 0.02 + pop size 10k (obs6) 
run_ibm_location(pop_size=5000, rng_seed=200, vaccination_uptake = 0.02)

#vaccination uptake 0.1 + pop size 10k (obs7) 
run_ibm_location(pop_size=5000, rng_seed=200, vaccination_uptake = 0.1)

#reduced transmission probability

#baseline reduced prop param (obs8)
run_ibm_location(rng_seed=200, transmission_prob=0.05, add_baseline=T)

#vaccination uptake 0.01 + reduced prop (obs9)
v = run_ibm_location(rng_seed=200, transmission_prob=0.05, vaccination_uptake = 0.01)
print(v)
#vaccination uptake 0.02 + reduced prop (obs10)
v = run_ibm_location(rng_seed=200, transmission_prob=0.05, vaccination_uptake = 0.02)
print(v)

#vaccination uptake 0.1 + reduced prop (obs11)
run_ibm_location(rng_seed=200, transmission_prob=0.05, vaccination_uptake = 0.1)

### compare delay vaccination

#add 2 day delay
#vaccination uptake 0.01 + 2 delay (obs12)
run_ibm_location(rng_seed=200, vaccination_uptake = 0.01, vaccination_start_delay=2, add_baseline=T)

#vaccination uptake 0.02 + 2 delay (obs13)
run_ibm_location(rng_seed=200, vaccination_uptake = 0.02, vaccination_start_delay=2, add_baseline=T)

#vaccination uptake 0.1 + 2 delay (obs14)

# some strange observations occur, when compare with the baseline, even tho the vaccination has a high
# uptake, the first couple of days the infections is more than the baseline, in truth this is because of the seed
run_ibm_location(rng_seed=200, vaccination_uptake = 0.1, vaccination_start_delay=2, add_baseline=T)
run_ibm_location(rng_seed=300, vaccination_uptake = 0.1, vaccination_start_delay=2, add_baseline=T)
run_ibm_location(rng_seed=400, vaccination_uptake = 0.1, vaccination_start_delay=2, add_baseline=T)
run_ibm_location(rng_seed=500, vaccination_uptake = 0.1, vaccination_start_delay=2, add_baseline=T)

# obs 14 is here
run_ibm_location(rng_seed=19, vaccination_uptake = 0.1, vaccination_start_delay=2, add_baseline=T)

#add 10 day delay
#vaccination uptake 0.01 + 10 delay (obs15)
run_ibm_location(rng_seed=200, vaccination_uptake = 0.01, vaccination_start_delay=10)

#vaccination uptake 0.02 + 10 delay (obs16)
run_ibm_location(rng_seed=200, vaccination_uptake = 0.02, vaccination_start_delay=10)

#vaccination uptake 0.1 + 10 delay (obs17)
run_ibm_location(rng_seed=200, vaccination_uptake = 0.1, vaccination_start_delay=10)

#add 5 day delay
#vaccination uptake 0.01 + 5 delay (obs18)
run_ibm_location(rng_seed=200, vaccination_uptake = 0.01, vaccination_start_delay=5)

#vaccination uptake 0.02 + 5 delay (obs19)
run_ibm_location(rng_seed=200, vaccination_uptake = 0.02, vaccination_start_delay=5)

#vaccination uptake 0.1 + 5 delay (obs20)
run_ibm_location(rng_seed=200, vaccination_uptake = 0.1, vaccination_start_delay=5)

### compare vaccination with initial coverage, still usefull to vaccinate
#vaccination 10% (obs21)
run_ibm_location(rng_seed=200, vaccine_coverage=0.1)

#vaccination uptake 0.01 + vaccine coverage 0.1 (obs22)
run_ibm_location(rng_seed=200, vaccine_coverage=0.1, vaccination_uptake = 0.01)

#vaccination uptake 0.02 + vaccine coverage 0.1 (obs23)
run_ibm_location(rng_seed=200, vaccine_coverage=0.1, vaccination_uptake = 0.02)

#vaccination uptake 0.1 + vaccine coverage 0.1 (obs24)
run_ibm_location(rng_seed=200, vaccine_coverage=0.1, vaccination_uptake = 0.1)

#vaccination 40% (obs25)
run_ibm_location(rng_seed=200, vaccine_coverage=0.4)

#vaccination uptake 0.01 + vaccine coverage 0.4 (obs26)
run_ibm_location(rng_seed=200, vaccine_coverage=0.4, vaccination_uptake = 0.01)

#vaccination uptake 0.02 + vaccine coverage 0.4 (obs27)
run_ibm_location(rng_seed=200, vaccine_coverage=0.4, vaccination_uptake = 0.02)

#vaccination uptake 0.1 + vaccine coverage 0.4 (obs28)
run_ibm_location(rng_seed=200, vaccine_coverage=0.4, vaccination_uptake = 0.1)

#vaccination uptake 0.05 + vaccine coverage 0.4 (obs29)
run_ibm_location(rng_seed=200, vaccine_coverage=0.4, vaccination_uptake = 0.05)


## map the vaccination uptake compared to delay (obs 30)
vaccination_uptakes = seq(0, 20)/100
vaccination_delay = seq(0, 10)

vaccination_coverage = seq(0, 5)/10

cov_values = list()
for (cov in vaccination_coverage){
  v_values = c()
  for (u in vaccination_uptakes){
    v = run_ibm_location(rng_seed=200, vaccine_coverage=cov, vaccination_uptake = u, vaccination_start_delay=0, bool_show_demographics=FALSE)
    v_values = c(v_values ,v)
    
  }
  cov_values = append(cov_values, list(v_values))
}

cov_values <- do.call(cbind, cov_values)

# plot vaccinations

plot(vaccination_uptakes, cov_values[, 1], ylab='Percentage of population vaccinated',
     xlab='Vaccination uptake',
     main='Vaccinated compared to uptake', type='l', ylim=c(0,1), xlim=c(0,0.2))

legend_columns = c('vaccination coverage: 0%')
for (i in 2:length(cov_values[1,])){
  print(i)
  
  lines(vaccination_uptakes, cov_values[, i],  col=i,lwd=2)
  legend_columns = c(legend_columns, paste0('vaccination coverage: ',(vaccination_coverage[i]*100),'%'))
  
}

for (i in 1: 20){
  abline(h = i/20, col="gray", lty=2)  # Vertical line at x
}

legend('bottomright',legend=legend_columns,col=1:4,lwd=5,ncol=2,cex=1,bg='white')


