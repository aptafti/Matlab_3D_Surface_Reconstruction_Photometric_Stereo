function depth=Depth(N,mask,h,w,d);

len=h*w;
A=sparse(len*2,len);
B=zeros(len*2,1);
for y=1:h-1
    for x=1:w-1        
        i=(y-1)*w+x;
        A(2*i-1,i)=-N(y,x,3);
        A(2*i-1,i+1)=N(y,x,3);
        B(2*i-1)=N(y,x,1);

        A(2*i,i)=-N(y,x,3);
        A(2*i,i+w)=N(y,x,3);
        B(2*i)=N(y,x,2);
    end
end
newrow=A(1:2*(len-1),1:len)\B(1:2*(len-1),1);
depth=reshape(newrow,w,h)';
% depth=depth-min(min(depth));
X=[1:w];
Y=[1:h];
Z=depth;
 
% z = reshape(z,r,c);
% z = z-min(min(z));


figure ('Name', '3D Reconstruction - View #1','NumberTitle','off'),
surfl(X,Y,Z)
shading interp
colormap bone
view([200 100 3500]);
saveas(gcf, strcat('results/view1.png'), 'png');

figure ('Name', '3D Reconstruction - View #2','NumberTitle','off'),
surfl(X,Y,Z)
shading interp
colormap bone
view([190 90]);
saveas(gcf, strcat('results/view2.png'), 'png');

% figure ('Name', '3D Reconstruction - View #3','NumberTitle','off'),
% surfl(X, Y, Z);
% shading interp
% colormap bone
% view([193 93]);
% saveas(gcf, strcat('results/view3.png'), 'png');

