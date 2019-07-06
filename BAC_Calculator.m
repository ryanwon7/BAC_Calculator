%% Student Information
%  Ryan Won and Raymond Zhang
%  Section: 63   
%% BAC Calculator
clc;
clear all;

combinedCell = takeFactors();
personalFactors = combinedCell{1,1};
alcoholAmounts = combinedCell{1,2};

alcConsumed = sum([alcoholAmounts{:}]);
age = personalFactors{1,1};
weight = personalFactors{1,2};
gender = string(personalFactors{1,3});
time = personalFactors{1,4};
food = string(personalFactors{1,5});
med = string(personalFactors{1,6});

BAC = calcBAC(alcConsumed, age, weight, gender, time, med, food);
if BAC < 0
    BAC = 0;
end

if lower(food) == 'yes'
    foodStr = 'You ate food before drinking.';
else
    foodStr = 'You did not eat before drinking.';
end
if lower(med) == 'yes'
    medStr = 'You had medicine before drinking.';
else
    medStr = 'You did not have medicine before drinking.';
end
messageString = { 'You are a ' + string(age) + ' year old ' + gender + ', who weighs ' + string(weight) + ' pounds.',...
    foodStr, medStr, 'It has been ' + string(time) + ' minutes since you drank.',...
    'You have consumed ' + string(round(alcConsumed,2)) + ' ounces of alcohol, causing ' + string(round(BAC,3)) + '% BAC.',...
    'You will be completely sober in ' + string(floor(BAC/0.016)) + ' hours and ' + string(ceil(((BAC/0.016)-floor(BAC/0.016))*60)) + ' minutes.'};
uiwait(msgbox(messageString, 'Summary'));
%% Plotting the BAC
timestart = 0;

y1 = [];
x1 = [];
y2 = [];
y3 = [];

endNum = ceil(BAC/0.016);
for t = 1:endNum
    if BAC > 0
        BAC = BAC - .016;
        if BAC < 0
            BAC = 0;
        end
    else
        BAC = 0;
    end
y1(t)= BAC;
end

for i = 1:endNum
    elaptime= timestart + (i - 1);
x1(i)=elaptime;    
end

for i = 1:endNum
    alclim = .08;
y2(i) = alclim;
end

for i = 1:endNum
    impaired = .04;
y3(i) = impaired;
end

plot(x1,y1,x1,y2,x1,y3)

hold on

axis= ([0 endNum 0 1]);
xlabel('Time (hr)');
ylabel('BAC (%)');
title('BAC Calculator');
legend('BAC Decrease Rate','Legal Drinking Limit','Driving Skills Affected','Location','northeast');
grid on;
hold off