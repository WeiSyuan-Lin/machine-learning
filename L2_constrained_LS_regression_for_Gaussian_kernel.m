n=50;
N=1000;
x=linspace(-3,3,n)';
X=linspace(-3,3,N)';

pix=pi*x;
y=sin(pix)./(pix)+0.1*x+0.05*randn(n,1); %¸ê®Æ

hh=2*0.3^2; l=0.1;

k=exp(-(repmat(x.^2,1,n)+repmat(x.^2',n,1)-2*x*x')/hh);
K=exp(-(repmat(X.^2,1,n)+repmat(x.^2',N,1)-2*X*x')/hh);

t1=k\y; F1=K*t1; t2=(k^2+1*eye(n))\(k*y); F2=K*t2;

figure(1);
clf;
hold on;
axis([-2.8 2.8 -0.5 1.2]);
plot(X,F1);plot(X,F2,'g-'); plot(x,y,'bo');


