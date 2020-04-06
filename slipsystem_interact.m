%developing a code to compare fcc slip systems for different grain families
clear all
%define each grain family
f200=[2,0,0;0,2,0];

%calculate normal vector for each plane
f200n=f200./vecnorm(f200,2,2);

%calculate the rotation matrix to define rotation of the normal vector to
%loading direction which we define in this case as y.
% functions to develop a rotation matrix which rotates
%vector A to the direction B
refd=[0,1,0];

ssc = @(vv) [0 -vv(3) vv(2); vv(3) 0 -vv(1); -vv(2) vv(1) 0];
RU = @(A,B) eye(3) + ssc(cross(A,B)) + ssc(cross(A,B))^2*(1-dot(A,B))/(norm(cross(A,B))^2);

%rotation matrix zero
%rotation=zeros(3);
for i=1:size(f200n,1)
    %check to see if vectors are already in the same direction
    
    rotation{i}(:,:)=RU(f200n(i,:),refd);
end

%use the rotation matrices to then rotate the slip systems.


%f200mx=vrrotvec(f200n(1,:),refd);








