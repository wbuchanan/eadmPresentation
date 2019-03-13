// Replays the model fitted to estimate the Average Treatment Effect on the Treated (ATET)
estimates restore atet

// Creates balance plot using kernel density plot to show distribution of the 
// estimated propensity scores
// scheme parameter would either need to be removed or specified using schemes
// available to the user
tebalance density, name(atetDensity) scheme(fcpstestlevs)

// Exports the graph as an SVG to be included in slide deck
gr export ../img/atetBalance.svg, as(svg) replace

// Creates a balance plot using box plot to show distribution of propensity scores
// scheme parameter would either need to be removed or specified using schemes
// available to the user
tebalance box, name(atetBoxPlot) scheme(fcpstestlevs)

// Exports the graph as an SVG to be included in slide deck
gr export ../img/atetBoxplot.svg, as(svg) replace

// Creates an overlap plot to show the distribution of the propensity scores 
// between intervention and comparison groups
// scheme parameter would either need to be removed or specified using schemes
// available to the user
teffects overlap, name(atetOverlap) scheme(fcpstestlevs)

// Exports the graph as an SVG to be included in slide deck
gr export ../img/atetOverlap.svg, as(svg) replace

// Replays the fitting of the model to estimate the Average Treatment Effect (ATE)
estimates restore ate

// Creates balance plot using kernel density plot to show distribution of the 
// estimated propensity scores
// scheme parameter would either need to be removed or specified using schemes
// available to the user
tebalance density, name(ateDensity) scheme(fcpstestlevs)

// Exports the graph as an SVG to be included in slide deck
gr export ../img/ateBalance.svg, as(svg) replace

// Creates a balance plot using box plot to show distribution of propensity scores
// scheme parameter would either need to be removed or specified using schemes
// available to the user
tebalance box, name(ateBoxPlot, replace) scheme(fcpstestlevs)

// Exports the graph as an SVG to be included in slide deck
gr export ../img/ateBoxplot.svg, as(svg) replace

// Creates an overlap plot to show the distribution of the propensity scores 
// between intervention and comparison groups
// scheme parameter would either need to be removed or specified using schemes
// available to the user
teffects overlap, name(ateOverlap, replace) scheme(fcpstestlevs)

// Exports the graph as an SVG to be included in slide deck
gr export ../img/ateOverlap.svg, as(svg) replace

// Replays the instrumental variables model fitted to the data
estimates restore ive

// Estimates the marginal effect of a 1 point increase in pre-test scores on 
// the post-test across all observations in the data
qui: margins, at(mthpre=(34(1)77))

// scheme parameter would either need to be removed or specified using schemes
// available to the user
marginsplot, scheme(matthiasg) name(ivemargins, replace) recastci(rarea) 	 ///   
yti("Predicted Post-Test Math Score") ysize(6) xsize(9)

// Exports the graph as an SVG to be included in slide deck
gr export ../img/iveMarginalEffectsOfPreTest.svg, as(svg) replace

// Replays the instrumental variables model fitted to the data
estimates restore ive

// Estimates the marginal effect of a 1 point increase in pre-test scores on 
// the post-test conditional on assignment to intervention/comparison groups
qui: margins, at(mthpre=(34(1)77)) over(intervention)

// scheme parameter would either need to be removed or specified using schemes
// available to the user
marginsplot, scheme(matthiasg) name(ivemargins, replace) recastci(rarea) 	 ///   
yti("Predicted Post-Test Math Score") ysize(6) xsize(9) 					 ///   
ti("Marginal Effects of Pre-Test By Intervention Groups")

// Exports the graph as an SVG to be included in slide deck
gr export ../img/iveMarginalEffectsOfPreTest2.svg, as(svg) replace
