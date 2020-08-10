function [Temp_User_1, Temp_User_2, Temp_User_3] = Mutation(User_1, User_2, User_3, Total_Supply, Fixed_Devices)

Peak = [8 9 15 19 20 21];
Offpeak = [9 10 11 12 13 14 16 17 18 22 23];
Waiting_Time=3;

for l = Fixed_Devices+1:size(User_3,1)
    for i = 1:length(Peak)
        for k = Peak(i)-Waiting_Time:Peak(i)+Waiting_Time
                    if k>0 && k<=24
                        if find(Offpeak==k)
                            if User_3(l,Peak(i))+sum(User_1(:,k)) + sum(User_2(:,k)) + sum(User_3(:,k)) < (Total_Supply(k))
                                User_3(l,k ) = User_3(l,k) + User_3(l,Peak(i));
                                User_3(l,Peak(i)) = 0;
                            end
                        end
                    end
        end
    end
end

for l = Fixed_Devices+1:size(User_2,1)
    for i = 1:length(Peak)
        for k = Peak(i)-Waiting_Time:Peak(i)+Waiting_Time
                    if k>0 && k<=24
                        if find(Offpeak==k)
                            if User_2(l,Peak(i)) + sum(User_1(:,k)) + sum(User_2(:,k)) + sum(User_3(:,k)) < (Total_Supply(k))
                                User_2(l,k) = User_2(l,k) + User_2(l,Peak(i));
                                User_2(l,Peak(i)) = 0;
                            end
                        end
                    end
        end
    end
end

for l = Fixed_Devices+1:size(User_1,1)
    for i = 1:length(Peak)
        for k = Peak(i)-Waiting_Time:Peak(i)+Waiting_Time
                    if k>0 && k<=24
                        if find(Offpeak==k)
                            if User_1(l,Peak(i)) + sum(User_1(:,k)) + sum(User_2(:,k)) + sum(User_3(:,k)) < (Total_Supply(k))
                                User_1(l,k) = User_1(l,k) + User_1(l,Peak(i));
                                User_1(l,Peak(i))=0;
                                
                            end
                        end
                    end
        end
    end
end
Temp_User_1 = User_1;
Temp_User_2 = User_2;
Temp_User_3 = User_3;
end