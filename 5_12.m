ls_perm_meas_data;

% Apply robust estimator huber
cvx_begin
    variable x(n)
    minimize(sum(huber(A*x-y,1)))
cvx_end

% Mark the k outliers with largest residuals as suspects
[vals, outliers]=sort(abs(A*x-y),'descend');
outliers=sort(outliers(1:k));
A_hat=A;
y_hat=y;
A_hat(outliers,:)=[]
y_hat(outliers)=[]
% Estimation of x using A_hat and y_hat
x_hat=A_hat\y_hat;

% Reorder A
[a,b]=sort(A(outliers,:)*x_hat);
[a,c]=sort(y(outliers));
permuted=outliers;
permuted(b,:)=permuted(c,:);
A(permuted,:)=A(outliers,:);
% Final estimation after reordering
x_final=A\y;

% Output the residual after this algorithm
norm(x_final-x_true)

% Output the entry indices that are marked permuted
outliers(find(outliers==permuted))=[]

