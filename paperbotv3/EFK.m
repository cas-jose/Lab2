



frontData = fopen('front.txt', 'r'); %opening the .txt files that carry the measurement data from the ESP8266
rightData = fopen('right.txt', 'r');
angleData = fopen('angleData.txt', 'r');
formatSpec = '%f';

xActual = fopen('x.txt', 'r');
yActual = fopen('y.txt', 'r');
angleActual = fopen('angle.txt', 'r');




x = fscanf(xActual, formatSpec);  %Inputting the measurements into column vectors. Already normalized
x = x.';
y = fscanf(yactual, formatSpec);
y = y.';
theta = fscanf(angleActual, formatSpec); %In Degrees
theta = theta.';

frontRange = fscanf(frontData, formatSpec); %In mm
frontRange = frontRange.';
rightRange = fscanf(rightData, formatSpec); 
rightRange = rightRange.';
angleMeas = fscanf(angleData, formatSpec);
angleMeas = angleMeas.';

angleMeas = angleMeas*pi/180;




delx = 375 - frontRange.*cos(angleMeas);
dely = 250 - rightRange.sin(pi/2 - angleMeas)
deltheta = angleMeas;



%Measurement Noise
wk = [-4; -6; -11]

%Model: 
xk = [x.' y.' theta.']; %Current State Matrix
zk = [delx.' dely.' deltheta.'] + wk; %Sensor Matrix

xhat = xk(1,:); %Initialize update state with the intial current state;;
F = [ 1 0 frontRange(1)*sin(angleMeas(1));  %Initializing Jacobian
      0 1 -rightRange*cos(pi/2-angleMeas(1));
      0 0 1];
Q = [1;1;1]
P = 


for i = 2:100
  
%Predict:
xhat = xhat;
Pk = F*P*transpose(F) + Q;
Gk = Pk*transpose(Hk)*inv(Hk*Pk*transpose(Hk)+ R);

%Update:

  
  
end
