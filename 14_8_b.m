% import data
spacecraft_landing_data;

% minimize touch down time
K_curr = K;
while(1)
    cvx_begin
        variables p(3, K_curr+1) v(3, K_curr+1) f(3, K_curr)
        minimize 0
        subject to        
            v(:,2:K_curr+1) == v(:,1:K_curr)+(h/m)*f-g*repmat([0;0;1],1,K_curr);
            p(:,2:K_curr+1) == p(:,1:K_curr)+(h/2)*(v(:,1:K_curr)+v(:,2:K_curr+1));
            v(:,1) == v0; v(:,K_curr+1) == 0; 
            p(:,1) == p0; p(:,K_curr+1) == 0; 
            norms(f) <= Fmax;
            p(3,:) >= alpha*norms(p(1:2,:));
    cvx_end
    if(strcmp(cvx_status, 'Infeasible') == 1)
        K_min = K_curr+1;
        break;
    end
    p_mink = p; v_mink = v; f_mink = f;
    K_curr = K_curr - 1;
end
K_min


% Plot:
 x = linspace(-40,55,30); y = linspace(0,55,30);
 [X,Y] = meshgrid(x,y);
 Z = alpha*sqrt(X.^2+Y.^2);
 figure; colormap autumn; surf(X,Y,Z);
 axis([-40,55,0,55,0,105]);
 grid on; hold on;

% INSERT YOUR VARIABLES HERE:
% -------------------------------------------------------
 plot3(p_mink(1,:),p_mink(2,:),p_mink(3,:),'b','linewidth',1.5);
 quiver3(p_mink(1,1:K_min),p_mink(2,1:K_min),p_mink(3,1:K_min),...
         f_mink(1,:),f_mink(2,:),f_mink(3,:),0.3,'k','linewidth',1.5);

