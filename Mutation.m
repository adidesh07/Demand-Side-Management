function [Temp_User_1, Temp_User_2, Temp_User_3] = Mutation(User_1, User_2, User_3, Fixed_Devices)

Temp_User_1 = mut_process(User_1, Fixed_Devices);
Temp_User_2 = mut_process(User_2, Fixed_Devices);
Temp_User_3 = mut_process(User_3, Fixed_Devices);

function Temp = mut_process(obj, Fixed_Devices)
    Peak = [8 9 15 19 20 21];
    Offpeak = [9 10 11 12 13 14 16 17 18 22 23];
    Waiting_Time=3;
    for l = Fixed_Devices+1:size(obj,1)
        for i = 1:length(Peak)
            for k = Peak(i)-Waiting_Time:Peak(i)+Waiting_Time
                if k>0 && k<=24
                    if find(Offpeak==k)
                        if obj(l,Peak(i))+sum(obj(:,k)) + sum(obj(:,k)) + sum(obj(:,k)) < 20
                            obj(l,k ) = obj(l,k) + obj(l,Peak(i));
                            obj(l,Peak(i)) = 0;
                            Temp = obj;
                        end
                    end
                end
            end
        end
    end    
end


end


    
    
