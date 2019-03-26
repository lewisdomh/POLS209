**Load the data
use https://github.com/lewisdomh/POLS209/raw/master/anes_pilot_2018_sub.dta

**Chi-square test of association between party identification and answer to the question: "Do you think the Russian government 
**probably interfered in the 2016 presidential election or do you think this probably did not happen?"
**Remember you want the dependent variable listed first and the independent variable listed second

tabulate russia16 party, col chi

**Chi-square test of association between 


**Difference of means test** 
**Respondents were asked to provide a thermometer rating for police. Does this estimate differ between men and women?

***First, produce a kernal density plot of thermometer rating of police (ftpolice) and gender (gender)

kdensity ftpolice if gender == 1, addplot(kdensity ftpolice if gender == 2) ///
	legend(label(1 "Male") label(2 "Female" ))

**Now perform a t-test of the difference in means of the dependent variable for men and women

ttest ftpolice, by(gender)

**Respondents were asked to provide a thermometer rating for police. 
**Does this estimate differ between Democrats and Republicans?

***First, produce a kernal density plot of thermometer rating of police (ftpolice) and party (party)
kdensity ftpolice if party == 1, addplot(kdensity ftpolice if party == 2) ///
	legend(label(1 "Democrat") label(2 "Republican" ))
	
**Now perform a t-test of the difference in means of the dependent variable for Democrats and Republicans
ttest ftpolice, by(party)

**Respondents were asked to provide a thermometer rating for the alt right. 
**Does this estimate differ between Democrats and Republicans?

***First, produce a kernal density plot of thermometer rating of the alt right (ftalright) and party (party)
kdensity ftaltright if party == 1, addplot(kdensity ftpolice if party == 2) ///
	legend(label(1 "Democrat") label(2 "Republican" ))

**Now perform a t-test of the difference in means of the dependent variable for Democrats and Republicans
ttest ftaltright, by(party)

**Let's look at the the relationship between feeling toward the #MeToo movement (ftmetoo) vs. feelings toward 
**Supreme Court Justice Brett Kavanaugh (ftkavanaugh)

**First, produce a scatterplot with ftmetoo along the x-axis and ftkavanaugh along the y-axis

graph twoway (lfit ftkavanaugh ftmetoo, lwidth(thick)) ///
	(scatter ftkavanaugh ftmetoo, msymbol(circle_hollow) mcolor(gs12) msize(small)), ///
		ytitle("Feeling Thermometer Justice Kavanaugh") ///
		xtitle("Feeling Thermometer #MeToo") ///
		legend(pos(6) order(2 "Data points" 1 "Linear Fit")) 
		
***Now, look at correlation coefficient and associated p-value for Kavanaugh feeling thermometer
***and #MeToo feeling thermometer

pwcorr ftkavanaugh ftmetoo, sig
