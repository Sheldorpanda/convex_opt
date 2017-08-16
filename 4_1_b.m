Q = [1 -1/2; -1/2 2];
A = [1 2; 1 -4; 5 76];
b = [-2 -3 1]';
sigma = [0 -0.1 0.1];
lambda = [1.8994 3.4684 0.0931];
p_star = 8.2222;
p_table = [];

for i = sigma
    for j = sigma
        p_pred = p_star - [i, j]*[lambda(1); lambda(2)];
        cvx_begin
            variable x(2)
            minimize (quad_form(x,Q) - x(1))
            subject to
                A*x <= b + [i; j; 0]
        cvx_end
        p_exact = cvx_optval;
        p_table = [p_table; i j p_pred p_exact]
    end
end

disp(p_table);
        
