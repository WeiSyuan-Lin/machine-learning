n=10; N=1000; x=linspace(-3,3,n)';
X=linspace(-4,4,N)';
y=x+0.2*randn(n,1); y(n)=-4;
p(:,1)=ones(n,1); p(:,2)=x; t=p\y; e=1;

for o=1:1000
r=abs(p*t-y); w=ones(n,1);
w(r>e)=e./r(r>e);
t0=(p'*(repmat(w,1,2).*p))\(p'*(w.*y));

if norm(t-t0)<0.001, break, end

t=t0;
end

P(:,1)=ones(N,1); P(:,2)=X; F=P*t;
figure(1); clf; hold on; axis([-4 4 -4.5 3.5]);
plot(X,F,'g-'); plot(x,y,'bo');