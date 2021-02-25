%% JL MBDS Q6
%% Points inside outside polygon

%1. Initialisation 
clear all
close all
clc 
warning off
disp('-----------------------Start-----------------------');

%% Load inputs:

q6_points = load('input_question_6_points');
q6_polygon = load('input_question_6_polygon');
ans6 = cell(10,3);

%% library function = inpolygon

% inpolygon(a,b,c,d) where:
% a = x-axis of points, b = y-axis of points, 
% c = x-axis of polygon, d = y-axis of polygon

in = inpolygon(q6_points(:,1),q6_points(:,2),q6_polygon(:,1),q6_polygon(:,2));

for i = 1:10 
    if in(i) == 1
        ans6{i,1} = q6_points(i,1);
        ans6{i,2} = q6_points(i,2);
        ans6{i,3} = 'Inside';
        
    elseif in(i) == 0 
        ans6{i,1} = q6_points(i,1);
        ans6{i,2} = q6_points(i,2);
        ans6{i,3} = 'Outside';        
    end
end

% open ans6 to get answer :)