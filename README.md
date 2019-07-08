<h1>BAC(Blood Alcohol Content) Calculator</h1>
Final Project for Drexel ENGR122 written by Ryan Won and Raymond Zhang. MATLAB code for a program that calculates BAC based on various 
factors.

<p><h3>Installation and Run</h3></p>
This program was written and tested in MATLAB R2017b. The programs was tested in R2018b as well. Program should be compatible with all supported versions 
of MATLAB. Additionally, the program requires no additional modules or libraries to run.
<p><p>To run the application, open the BAC_Calculator.m file and click run.</p>

<p><h3>Purpose</h3>
The object of the program is to help the user determine whether their BAC(Blood Alcohol Content) is above the legal driving limit, based 
on factors derived from the user themself and the drinks they have consumed. 
<p><p>Factors considered in our computations are:

* Age

* Weight

* Gender

* Time since drinking

* Food consumed since drinking

* Any medicine consumed

<p><h3>Mathematical Formula</h3>
<h4> BAC = ((factor * alcConsumed * 5.14) / (weight * r)) - 0.015*(time/60); </h4>
Where

* factor =  (age-21)/100 + 1 if older than 21 where age is user age

* alcConsumed = alcohol consumed in ounces

* weight =  user weight in pounds (lb)

* r = gender constant, where r = 0.73 if user is male or r = 0.66 if user is female

* time = time in minutes since the user consumed alcohol

<p><h3>User Interface</h3>
Our application is designed to be easy to use for the user, as they will most likely be intoxicated to some degree. Below is the first
dialog box that the user faces. It asks for inputs of the general information about the user required to make the computations.

![Image of GUI](https://i.gyazo.com/c12839961dc8c31ab2cb83b69da46b7b.png)

The next menu displays a list of popular brands of drinks. These drinks can be selected by clicking, and multiple can be selected by using Ctrl+click.
The ABV values of these drinks are stored in the alcDrinks spreadsheet. For drinks not in the list, a generic version of the drink can be selected
which has an average value for the type of drink.

![Image of GUI](https://i.gyazo.com/941d5477a68b3cf891164d507fb980a3.png)

Based on the user's selections, the program then asks to input the amount of each drink consumed, in fl. oz. Volumetric measurements of
common drink choices(can, shot glass, wine glass) are provided for the user as well.

![Image of GUI](https://i.gyazo.com/c678c2472296748f70129cb4d69914b4.png)

Finally, the program displays the user's choices, as well as information on their BAC level and how long it will take them to be completely sober.
It also displays a graph displaying a plot of their BAC level over time, with indicators for the legal driving limit for BAC, and the 
common BAC level at which people have their driving skills impaired.

![Image of GUI](https://i.gyazo.com/e1bfde532f503d2ed9b2dfab68b10baf.png)

![Image of GUI](https://i.gyazo.com/4231ec4d601244ef70940613442ec166.png)
