n=80;
x=linspace(-3,3,n)';
pix=pi*x;
y=sin(pix)./(pix)+0.1*x+0.05*randn(n,1); %資料

hh=2*0.3^2;
t=randn(n,1); 
e=0.1;
for o=1:n*1000
 i=ceil(rand*n);
 ki=exp(-(x-x(i)).^2/hh);
 t0=t+e*ki*(y(i)-ki'*t);
 
 if norm(t-t0)<0.000001,break
 end
  t=t0;
end

N=1000;%畫圖用的點數
X=linspace(-3,3,N)';
K=exp(-(repmat(X.^2,1,n)+repmat(x.^2',N,1)-2*X*x')/hh);
F=K*t;

figure(1);
clf;
hold on;
axis([-2.8 2.8 -0.5 1.2]);
plot(X,F); plot(x,y,'bo');

