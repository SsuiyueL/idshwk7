image = imread('1.jpg');
password = '57117237liuyaokun';
length_pwd=strlength(password);
passInt8 = uint8(password);
lsb=image;
[r,c]=size(image);
converted = dec2bin(passInt8);
[a,b]=size(converted);

newimage=image;

for i=1:1:a
	for j=1:1:b
    	if ((converted(i,j)) == 0)
        	if(mod(image(i,j),2) == 1)
            	newimage(i,j) = image(i,j)-1;
        	end
    	else
        	if((image(i,j)) == 0)
            	newimage(i,j) = image(i,j)+1;
        	end
    	end
	end
end
 
imwrite(newimage,'new.jpg','jpg')

for i=1:1:a
	for j=1:1:b
    	retrievedPwd(i,j) = (newimage(i,j));
	end
end

for i=1:1:a
	number = 0;
	k = b;
	for j=1:1:b
    	number=number + mod(retrievedPwd(i,j),2)*(2^(k-1));

        	k=k-1;
	end
	newConverted(i) = number;

end
 
finalPassword = char(newConverted);
