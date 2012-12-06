function op = opImgather(dim,z,xr,xs,t)

% Determine sizes
m = prod(dim);

[xxr xxs] = ndgrid(xr,xs);
hh = .5*(xxs-xxr);
h = unique(hh)';
[f,kh] = fkk(t,h);
[ff,kkh] = ndgrid(f,kh);
p = kkh./ff;
p = unique(p);
n = length(xs)*length(z)*length(p);

% Construct the operator
fh = @(data,mode) opImgather(data,z,xr,xs,t,mode);
op = opFunction(n, m, fh);


function y = opImgather(data,z,xr,xs,t,mode)

    if (mode == 0)
        
        y = {m,m,[0,0,0,0],{'opDSR'}};
        
    elseif (mode == 1)
        
        y = imgather(data,z,xr,xs,t);
        y = vec(y);
        
    else % mode = -1
        
        y = imgather_2(data,z,xr,xs,t);
        y= vec(y);
        
    end % end of if mode == 0




end

end