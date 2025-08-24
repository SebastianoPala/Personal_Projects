function x=sys_solve(A,b)
    [L,U,c]=my_gauss(A,b);
    %y=inf_solve(L,b);   
    %x=sup_solve(U,y); 
    for i=1:size(b,2)
        x(:,i)= sup_solve(U,c(:,i)); %c è L^-1 * b, posso farlo se ho fatto gauss su b, altrimenti devo
    end         
    
end