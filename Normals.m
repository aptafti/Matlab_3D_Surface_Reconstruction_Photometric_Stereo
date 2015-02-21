function N = Normals( I,mask, L )

numOfImages = size(L,1);


[height, width] = size(mask);
N = zeros(height, width, 3);
Ii = zeros(numOfImages,1);
Li = zeros(numOfImages,3);

for i=1:height
    for j = 1:width
        if mask(i,j)
            for k = 1:numOfImages               
                Ii(k,1) = I(i,j,k);
                Li(k,:) = Ii(k,1).* L(k,:);  
                Ii(k,1) = Ii(k,1)* Ii(k,1);       
            end  
            g = Li \ Ii; 
            N(i, j, :) = g / norm(g);
        end
    end
end

end


