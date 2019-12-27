
% method of least squares for kernel Model
n=140;% 輸入資料數
N=5000;
h=10;
x=linspace(-3,3,n)';
X=linspace(-3,3,N)';


pix=pi*x;
y=sin(pix)./(pix)+0.1*x+0.05*randn(n,1); %資料

%initialization
p=ones(n,1);
P=ones(N,1);
%construct design matrix p

 for j=1:n
    p(:,j)=exp(-(x-x(j)).^2/2*h^2);
    P(:,j)=exp(-(X-x(j)).^2/2*h^2);
 end
 

t=p\y; %find the theta
F=P*t; %回歸線

figure(1);
clf;
hold on;
axis([-2.8 2.8 -0.5 1.2]);
plot(X,F); plot(x,y,'bo');

