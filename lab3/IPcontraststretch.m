function X = IPcontraststretch(image)
    
    % determine amount of bits in image
    if isa(image,'uint8') || isa(image,'double')
        N = 8;
    elseif isa(image,'uint16')
        N = 16;
    elseif isa(image,'uint32')
        N = 32;
    elseif isa(image,'uint64')
        N = 64;
    else
        N = 8;
    end
    
    if ~isa(image,'double')
        X = im2double(image);
    else
        X = image;
    end
    
    M = max(X(:));
    m = min(X(:));
    
    X = (1/(M - m))*(X - m);
    
    if N == 8
        X = uint8(X*255);
    elseif N == 16
        X = uint16(X*(2^16 - 1));
    elseif N == 32
        X = uint32(X*(2^32 - 1));
    else
        X = uint64(X*(2^64 - 1));
    end
    
end

