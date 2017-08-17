import simple_portfolio_data.*

r_unif = (pbar)' * x_unif;
r_expect = r_unif - 0.05

for i = 1 : 10
    cvx_begin
    variable x1(n)
    minimize(quad_form(x1, S))
    subject to
        ones(1, n)*x1 == 1;
        (pbar)' * x1 == r_expect;
        % long only:
        x1 >= 0;
    cvx_end
    scatter(sqrt(cvx_optval),r_expect,'red'); hold on;
    
    cvx_begin
    variable x1(n)
    minimize(quad_form(x1, S))
    subject to
        ones(1, n)*x1 == 1;
        (pbar)' * x1 == r_expect;
        % short limited:
        ones(1,n)*(max(-x1, zeros(n, 1))) <= 0.5;
    cvx_end
    scatter(sqrt(cvx_optval),r_expect,'blue'); hold on;
    
    r_expect = r_expect + 0.01
end