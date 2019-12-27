function LS_regression(n,N)
% method of least squares for Linear-in-Parameter Model
%n=20; 輸入資料數
%N=1000; 畫圖用的點數
x=linspace(-3,3,n)';
X=linspace(-3,3,N)';

pix=pi*x;
y=sin(pix)./(pix)+0.1*x+0.05*randn(n,1); %資料

%initialization
p=ones(n,1);
P=ones(N,1);

%construct design matrix p
for j=1:15

    p(:,2*j)=sin((j/2)*x); p(:,2*j+1)=cos((j/2)*x);
    P(:,2*j)=sin((j/2)*X); P(:,2*j+1)=cos((j/2)*X);

end
t=p\y; %find the theta
F=P*t; %回歸線

figure(1);
clf;
hold on;
axis([-2.8 2.8 -0.5 1.2]);
plot(X,F); plot(x,y,'bo');

end