n=50; x=linspace(-3,3,n)'; pix=pi*x;
y=sin(pix)./(pix)+0.1*x+0.2*randn(n,1);

x2=x.^2; 
xx=repmat(x2,1,n)+repmat(x2',n,1)-2*x*x';
hhs=2*[0.03 0.3 3].^2; ls=[0.0001 0.1 100];
m=5; u=mod(randperm(n),m)+1;

for hk=1:length(hhs)
hh=hhs(hk); k=exp(-xx/hh);

  for i=1:m
   ki=k(u~=i,:); kc=k(u==i,:); yi=y(u~=i); yc=y(u==i);

     for lk=1:length(ls)
       t=(ki'*ki+ls(lk)*eye(n))\(ki'*yi);
       g(hk,lk,i)=mean((yc-kc*t).^2);

     end

   end

end
[gl,ggl]=min(mean(g,3),[],2); [ghl,gghl]=min(gl);
L=ls(ggl(gghl)); HH=hhs(gghl);

N=1000; X=linspace(-3,3,N)';
K=exp(-(repmat(X.^2,1,n)+repmat(x2',N,1)-2*X*x')/HH);
k=exp(-xx/HH); t=(k^2+L*eye(n))\(k*y); F=K*t;

figure(1); clf; 
hold on; axis([-2.8 2.8 -0.7 1.7]);
plot(X,F,'g-'); plot(x,y,'bo');
