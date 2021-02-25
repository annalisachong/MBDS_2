%% JL MBDS Q1
%% Operations for the right sum 

%1. Initialisation 
clear all
close all
clc 
warning off
disp('-----------------------Start-----------------------');

%% Notes
% only 2 operations allowed: Right or Down
% meaning it can only move maximum total row/column - 1 times.
% meaning m-1 + n-1 times (eg: 9-1 + 9-1 = 16 steps)
% total = m+n-1 numbers added
% always add the first and last number 

%% Min Max

% minSum = (1*col-1) + (row*row+1)/2
% maxSum = (#lastRow)*(#lastRow-1) + (row*row+1)/2
% minSum = (1*8) + (9*10)/2   %min = (sum of first row -1) + sum of last column = 53
% maxSum = (9*8) + (9*10)/2   %max = (sum of last row - #Row) + sum of first column  = 117

%from last column (min) move one column leftwards (col9 to col8), add 8 to sum 
%remainder after dividing by 8 to +1 : and have two of that number in the sum.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
%% Comment out which part you wna run: 1a or 1b %%%%%%%%%%%%%%%%%%%%%%%% %%
%% 1a) 
%same m n 

m = 9;      %row
n = 9;      %col

minSum = (1*(n-1)) + (m*(m+1))/2;      %min summed number = 53
maxSum = (m*(n-1)) + (m*(m+1))/2;      %max summed number = 117
midSum_Same = 2*((m-1)*m/2) + m;       %for same m n

sumNum = [65,72,90,110];
R = 'R'; D = 'D'; RD = 'RD'; DR = 'DR';

for i = 1:4
    if sumNum(1,i) == maxSum
        operations = [repmat(D, 1, (m-1)), repmat(R, 1, (n-1))];
    elseif sumNum(1,i) == minSum     
        operations = [repmat(R, 1, (n-1)), repmat(D, 1, (m-1))];
    elseif sumNum(1,i) == midSum_Same
        operations = [repmat(RD, 1, (n-1))];
    else
        diff = sumNum(1,i) - minSum;
        Quotient = floor(diff/8);      %quotient
        Remainder = rem(diff,8);       %remainder
        moveR = (n-1) - Quotient - 1;      %move first row, right how many times
        moveD = Remainder;
        operations = [repmat(R,1,moveR),repmat(D,1,moveD),repmat(R,1,1),repmat(D,1,((m-1)-moveD)),repmat(R,1,(n-2-moveR))];
        ans1{i,1} = sumNum(1,i); 
        ans1{i,2} = operations;
    end    
end

%% reverse check (same m n)

steps = (m-1)+(n-1);
op = char(ans1(2,2));     %change accordingly for the sum you wna check.

for i = 2:steps
    if op(i-1) == 'R'
        num_op(1,1) = 1;
        num_op(1,i) = num_op(1,i-1);
    elseif op(i-1) == 'D'
        num_op(1,1) = 1;
        num_op(1,i) = num_op(1,i-1)+1;
    end
    num_op(1,steps+1) = m;          %number path
    sum_num_op = sum(num_op);       %sum of numbers in path should be equal to answer
end

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
%% 1b 
m = 90000;      %row
n = 100000;      %col

minSum = (1*(n-1)) + (m*(m+1))/2;
maxSum = (m*(n-1)) + (m*(m+1))/2;

sumNum = [87127231192, 5994891682];
R = 'R'; D = 'D'; RD = 'RD'; DR = 'DR';

for i = 1:2
    if sumNum(1,i) < minSum 
        ans1{i,1} = sumNum(1,i); 
        ans1{i,2} = 'Error. Summed Number less than Min Number';
    elseif sumNum(1,i) > maxSum 
        ans1{i,1} = sumNum(1,i); 
        ans1{i,2} = 'Error. Summed Number more than Max Number';
    elseif sumNum(1,i) == maxSum
        operations = [repmat(D, 1, (m-1)), repmat(R, 1, (n-1))];
    elseif sumNum(1,i) == minSum     
        operations = [repmat(R, 1, (n-1)), repmat(D, 1, (m-1))];
    else
        diff = sumNum(1,i) - minSum;
        Quotient = floor(diff/(m-1));      %quotient
        Remainder = rem(diff,(m-1));       %remainder
        moveR = (n-1) - Quotient - 1;      %move first row, right how many times
        moveD = Remainder;
        operations = [repmat(R,1,moveR),repmat(D,1,moveD),repmat(R,1,1),repmat(D,1,((m-1)-moveD)),repmat(R,1,(n-2-moveR))];
        ans1{i,1} = sumNum(1,i); 
        ans1{i,2} = operations;
    end    
end

%% reverse check (same m n)

steps = (m-1)+(n-1);
op = char(ans1(2,2));     %change accordingly for the sum you wna check.

for i = 2:steps
    if op(i-1) == 'R'
        num_op(1,1) = 1;
        num_op(1,i) = num_op(1,i-1);
    elseif op(i-1) == 'D'
        num_op(1,1) = 1;
        num_op(1,i) = num_op(1,i-1)+1;
    end
    num_op(1,steps+1) = m;          %number path
    sum_num_op = sum(num_op);       %sum of numbers in path should be equal to answer
end
