arglist = argv();
nframes  = str2num(arglist{1});
basename = arglist{2};

% Construct plane wave moving along y direction, with the E field oscillating
% along z direction. Set wavelength equal to the size of the box

sx = sy = sz = 10;

% Wavenumber:
k = 2*pi/sy; % i.e. wavelength = box size (y-axis)

% Frequency:
w = 2*pi/nframes;

% Time matrix
T = zeros(sx,sy,sz,1,nframes);
for t = 1:nframes
    T(:,:,:,1,t) = t;
end % for
t = T(:);

% Coordinate matrices
x = [1:sx];
y = [1:sy];
z = [1:sz];

[X,Y,Z] = meshgrid(x, y, z);

% Maximum E-field
E0 = 0.5;

% Result
vf = zeros(sx,sy,sz,4,nframes);

for t = 1:nframes

    T = t*ones(sx,sy,sz);
    phase = mod(k*Y - w*T + 0.01, 2*pi); % +0.01 so that vectors are never 0
    vf(:,:,:,1,t) = 0;
    vf(:,:,:,2,t) = 0;
    vf(:,:,:,3,t) = E0*sin(phase);
    vf(:,:,:,4,t) = phase/(2*pi);

end % for

writevf( vf, basename );
