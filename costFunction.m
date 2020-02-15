function [jval,gradient1]=costFunction(initialTheta,X,y)
	
	z = X * initialTheta;
	h = 1./(1+exp(-z));
	m=length(y);
	jval=-1/m*(log(h')*y + log((1-h)')*(1-y));
		
	gradient1=zeros(size(initialTheta));

	for i=1:length(initialTheta)
		gradient1(i)=(1/m)*(X(:,i)'*(h-y));
	endfor
	
end