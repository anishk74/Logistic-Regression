filename=input('Enter the CSV dataset: ','s');
file=csvread(filename);
file=file(randperm(size(file,1)),:);
fileSize=size(file);
y=file(:,fileSize(2));
X=file(:,1:(fileSize(2)-1));

o=ones(fileSize(1),1);
X=[o,X];
[rowsX,columnsX]=size(X);

initTheta=zeros(columnsX,1);
options = optimset('GradObj', 'on', 'MaxIter', 400);

[optimalTheta, funVal, exitValue] = fminunc(@(theta)(costFunction(theta, X, y)), initTheta, options);

fprintf('The optimal logistic theta vector is: \n');
disp(optimalTheta);
fprintf('The value of cost function at optimal theta is: \n');
disp(funVal);