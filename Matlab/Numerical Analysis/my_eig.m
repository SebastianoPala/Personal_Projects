function [D,V]=my_eig(A,k)
    %prima porto A in forma triangolare
    Aold=A;
    for i=1:k
        [Q,R]=my_qr(Aold);
        Anew=R*Q;
        Aold=Anew;
    end
    %NON va
    D=diag(Anew);
    Anew=triu(Anew);
    V=zeros(size(A,1));
    V(1,1)=1;
    for i=2:size(A,2)
        T=Anew;
        T= T-eye(size(A,2))*D(i);
        z=T(1:i-1,i);
        V(:,i)=[ T(1:i-1,1:i-1)\-z;1;zeros(size(A,2)-i,1)];
    end
end