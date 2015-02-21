function A = Albedos(I, mask, L, N)
numOfImages = size(L,1);

[height, width] = size(mask);
A = zeros(height, width, 3);
Ni = zeros(3,1);
Ji = zeros(numOfImages,1);
Ii = zeros(numOfImages,1);

for i=1:height
    for j = 1:width
        if mask(i,j)
            for k = 1:3               
                Ni(k,1) = N(i,j,k);          
            end               
            
            Ji = L * Ni;
            
            for k = 1:3  %color
                for l = 1:numOfImages               
                    Ii(l,1) = I(i,j,k,l);
                end
                A(i, j, k) = (Ii' * Ji) / (Ji' * Ji);          
            end 
            
        end
    end
end

minA = min(min(min(A)));
maxA = max(max(max(A)));
A = (A - minA) / (maxA - minA);

end


