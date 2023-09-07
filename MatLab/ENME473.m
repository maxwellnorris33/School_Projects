%% part 1 of assignemnt
clc; clear;close all
global o5a ab ae agx agy bc o2c o2d o2o5 de t2
%variables
o5a = 1.4;
ab = 0.4;
ae = 2.4;
agx = 3.2;
agy = 0.3;
bc = 1.6;
o2c = 0.5;
o2d = 0.5;
o2o5 = 1.4;
de = 1.8;
%sstarting position of theta 2
theta2_start = 0;
%initial guess
initialg = [60,50,100,80];

%creating a table to store ansers
iterations = 360/5;
size = [length(linspace(theta2_start,360,iterations)),5];
types = {'single','double', 'double', 'double', 'double'};
names = {'theta 2','theta 3', 'theta 4', 'theta 5', 'theta 6'};
tab = table('Size', size,'VariableTypes',types,'VariableNames',names);

count = 1;
%solving shit
for theta2=theta2_start:5:360
    t2 = theta2;
    A = @VLE;
    answers = fsolve(A,initialg);
    tab(count,:) = num2cell([theta2, answers]);

    count = count + 1;
end

%% calculating location of point G
%distance from a to g
ag = sqrt(agx^2+agy^2);
%angle from a to g
thetaag = atand(agy/agx);
%creating arbitrary matrix to store values in
t = zeros(1,2);
for i = 1:height(tab)
    %calculating the locations of gx and gy
    gx = o5a*cosd(table2array(tab(i,'theta 5'))) + ag*cosd(table2array(tab(i,'theta 6'))-180+thetaag);
    gy = o5a*sind(table2array(tab(i,'theta 5'))) + ag*sind(table2array(tab(i,'theta 6'))-180+thetaag);
    t(i,:) = [gx,gy];
end 

% ploting and making data table
writetable(tab,'part1Results.csv')
tab.Gx = t(:,1);
tab.Gy = t(:,2);
fig = scatter(tab.Gx, tab.Gy, 'x');
title('Path of Point G with respect to the origin')
xlabel('x location (m)')
ylabel('y location (m)')
saveas(fig,'PathOfG.jpg')
%% funcion for vecotr loop equation
function vle = VLE(initialg)
    global o5a ab ae agx agy bc o2c o2d o2o5 de t2
    
    %creating local variables for angles
    theta3 = initialg(1);
    theta4 = initialg(2);
    theta5 =initialg(3);
    theta6=initialg(4);

    % purple loop
    vle(1) = o2c*cosd(t2)+bc*cosd(theta3)+ab*cosd(theta6)-o5a*cosd(theta5)+o2o5;
    vle(2) = o2c*sind(t2)+bc*sind(theta3)+ab*sind(theta6)-o5a*sind(theta5);
    
    %green looop
    vle(3) = o2d*cosd(t2+180)+de*cosd(theta4)+ae*cosd(theta6)-o5a*cosd(theta5)+o2o5;
    vle(4) = o2d*sind(t2+180)+de*sind(theta4)+ae*sind(theta6)-o5a*sind(theta5);
    
    end