arglist = argv();
nframes  = str2num(arglist{1});
basename = arglist{2};

% White noise: {x,y,z,{u,v,w},nframes}
ksize = 20;
n = randn(10,10,10,3,nframes+ksize-1);

% Gaussian kernel to smooth out noise in the time axis
k = zeros(1,1,1,1,ksize);
k(1:length(k)) = normpdf(linspace(-3,3,length(k)));

% Reddened noise
r = convn(n, k, "valid");

% Normalise
N = r / max(r(:));

% Write out the result
writevf( N, basename );
