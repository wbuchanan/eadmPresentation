// Load example data from methods matter
use data/ch12_catholic.dta, clear

// Rename/label some variables
rename (read12 math12 hsgrad catholic read8 math8 parmar8 faminc8 fathed8 	 ///   
mothed8 nohw8 disrupt8 riskdrop8 fhowfar mhowfar fight8 female)(rlapost 	 ///   
mthpost grdcomplete intervention rlapre mthpre parmarried famincome dadedu 	 ///   
momedu nohw disruptive riskfactors dadgoals momgoals fighting sex)

// Define new variable labels for variables
la var rlapre "Pre-Intervention Standardized Reading Score"
la var rlapost "Post-Intervention Standardized Reading Score"
la var mthpre "Pre-Intervention Standardized Mathematics Score"
la var mthpost "Post-Intervention Standardized Mathematics Score"
la var grdcomplete "Graduated on time"
la var intervention "Student Participated in Intervention Program"
la var parmarried "Parents Marital Status at Pre-Intervention"
la var famincome "Total Annual Family Income at Pre-Intervention"
la var dadedu "Father's Highest Level of Education"
la var momedu "Mother's Highest Level of Education"
la var nohw "Student Rarely Completes Homework"
la var disruptive "Student is Regularly Disruptive in Class"
la var riskfactors "# of Dropout Risk Factors for the Student"
la var dadgoals "Father's Educational Goals for Child"
la var momgoals "Mother's Educational Goals for Child"
la var fighting "Student has been in a fight with another student"
la var sex "Student Sex"
la var race "Ethnoracial Identity of the Student"

// Define value labels
la def race 1 "Asian/Pacific Islander" 2 "Hispanic/Latinx" 3 "Black"		 ///   
			4 "White" 5 "Native American", modify
			
la def sex 0 "Male" 1 "Female", modify	

la def intervention 0 "Did Not Recieve Intervention" 1 "Received Intervention", modify	
la def grdcomplete 0 "Did Not Graduate On-Time" 1 "Graduated On-Time", modify
la def edcomplete 	1 "HS Dropout" 2 "HS Grad" 3 "Junior College" 			 ///   
					4 "< 4 Years of College" 5 "Bachelor's Degree" 			 ///   
					6 "Master's Degree" 7 "Doctorate" 8 "Unknown", modify

la def edgoals 	1 "HS Dropout" 2 "Graduate HS" 3 "Junior College Degree"	 /// 
				4 "< 4 Years of College" 5 "Bachelor's Degree"				 ///   
				6 "Post-Secondary Degree", modify
				
la def fighting 0 "0" 1 "1-2 Fights" 2 "> 2 Fights", modify	
la def nohw 0 "Regularly Completes Homework" 1 "Rarely Completes Homework", modify
la def disruptive 0 "Not Regularly Disruptive" 1 "Regularly Disruptive", modify			

// Apply value labels
la val race race
la val sex sex
la val intervention intervention
la val grdcomplete grdcomplete
la val momedu edcomplete
la val dadedu edcomplete
la val momgoals edgoals
la val dadgoals edgoals
la val fighting fighting
la val nohw nohw
la val disruptive disruptive

// Drop variables that aren't required
drop inpse white black hisp api nativam

// Expand all the factor variables
foreach v of var race momedu dadedu momgoals dadgoals fighting {

	// Expand factor variables into set of dummy coded variables
	qui: ta `v', g(`v')
	
} // End Loop to generate set of indicators for all factor variables
