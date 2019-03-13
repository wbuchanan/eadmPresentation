// Fits a propensity score matching model of the average treatment effect on the 
// treated
teffects psmatch (mthpost) (intervention famincome dadedu5 dadedu6 dadedu7	 ///   
momedu5 momedu6 momedu7 dadgoals5 dadgoals6 momgoals5 momgoals6 fighting2	 ///   
parmarried mthpre fighting3 nohw race1 race2 race3 race5 riskfactors,		 ///   
logit),  atet

// Store the estimates
estimates store atet

// Fits a propensity score matching model of the average treatment effect
teffects psmatch (mthpost) (intervention famincome dadedu5 dadedu6 dadedu7	 ///   
momedu5 momedu6 momedu7 dadgoals5 dadgoals6 momgoals5 momgoals6 fighting2	 ///   
parmarried mthpre fighting3 nohw race1 race2 race3 race5 riskfactors,		 ///   
logit),  ate

// Store the estimates
estimates store ate

// Instrumental Variables estimate using 2 stage least squares
ivregress 2sls mthpost nohw i.race i.parmarried c.mthpre ib1.fighting 		 ///   
(intervention = famincome i.dadedu i.momedu i.dadgoals i.momgoals mthpre)

// Store the estimates
estimates store ive
