%% JL MBDS Q4
%% Connected components

%1. Initialisation 
clear all
close all
clc 
warning off
disp('-----------------------Start-----------------------');

%% RUN AND OPEN 'ans4' FOR ANSWER !!!
q4 = load('input_question_4');
ans4 = q4;

i = 1;
%column 1 initialize
for r = 2:10
    if ans4(r,1) ~= 0          %if (2,1) not 0 
        if ans4(r-1,1) ~= 0    %if top(1,1) not 0
            ans4(r,1) = ans4(r-1,1);    %(2,1)=(1,1)(become same as top)
        else
            ans4(r,1) = i;      %fresh index
            i = i+1;            %+1 for next fresh index 
        end
    end
end

%% looplooploop

for c = 2:20
    if ans4(1,c) ~= 0                               %if row 1 not 0
        if ans4(1,c-1) ~=0                          %if row 1 left side not 0
            ans4(1,c) = ans4(1,c-1);                %same as left side num
        else                                        %if row 1 left side 0
            ans4(1,c) = max(max(ans4(:,1:c)))+1;    %if left 0, fresh index
        end
    end
    for r = 2:10      
        if ans4(r,c) ~= 0                                           %if not 0, check top
            if ans4(r-1,c) ~= 0                                     %if top not 0, left 0 
                ans4(r,c) = ans4(r-1,c);                            %become same as top
                if ans4(r,c-1) ~= 0 & ans4(r,c-1) < ans4(r,c)       %if left is smaller 
                    for rr = 1:r
                        if ans4(rr,c) == ans4(r,c)                  %anything in column same as current
                            ans4(rr,c) = ans4(r,c-1);               %all change to left
                            if ans4(rr,c-1) ~= 0                    %if left not 0 then all num same change to right
                                ans4(ans4 == ans4(rr,c-1)) = ans4(r,c-1);            
                            end
                                
                        end
                    end
                elseif ans4(r,c-1) > 1 & ans4(r,c-1) > ans4(r,c)        %if left is bigger
                    ans4(r,c-1) = ans4(r,c);                            %left change to right 
                                        
                    for rr = 1:r                                        %for column
                        if ans4(rr,c) > ans4(r,c-1)                     %anything in column > left   
                            ans4(rr,c) = max(max(ans4(:,1:c-1)))+1;     %change to new number                            
                        end
                    end
                end
            elseif ans4(r,c-1) ~= 0 & ans4(r-1,c) == 0                  %elseif top 0, left not 0
                ans4(r,c) = ans4(r,c-1);                                %become same as left   
            elseif ans4(r-1,c) == 0 & ans4(r,c-1) == 0
                ans4(r,c) = max(max(ans4))+1;                           %if left 0, fresh index
            end
        end
    end
end

