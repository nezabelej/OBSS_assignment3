function If = marrHildreth(I, thresh)
    If = zeros(size(I));
    
    for i=2:size(I,1)-1
        for j=2:size(I,2)-1
           % get 3x3 patch
           patch = I(i-1:i+1,j-1:j+1);
           n = 0;
           % L <-> R
           % 1.part (signs) just tells us where the edge is
           % In that case, you lose some of the information
           if sign(patch(2,1))*sign(patch(2,3)) < 0 && abs(patch(2,1)-patch(2,3)) >= thresh
               n = n + 1;
           end
           % U <-> D
           if sign(patch(1,2))*sign(patch(3,2)) < 0 && abs(patch(1,2)-patch(3,2)) >= thresh
               n = n + 1;
           end
           % UL <-> LR
           if sign(patch(1,1))*sign(patch(3,3)) < 0 && abs(patch(1,1)-patch(3,3)) >= thresh
               n = n + 1;
           end
           % UR <-> LL
           if sign(patch(1,3))*sign(patch(3,1)) < 0 && abs(patch(1,3)-patch(3,1)) >= thresh
               n = n + 1;
           end
           
           if n >= 2
               If(i,j) = 255;
           end
        end
    end
end

