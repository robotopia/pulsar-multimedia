function writevf( vf, basename )
% Description:
%
% Writes out a time-varying vector field represented by an Octave matrix with
% dimensions x,y,z,3,n, where x, y, and z are the number of points in grid
% along each respective axis, and n is the number of animation frames.
%
% The output format matches the Gnuplot vector style:
%   x, y, z, dx, dy, dz
%
% Sam McSweeney, 2017

S = size(vf);

% Prepare the coordinates
x = [1:S(1)];
y = [1:S(2)];
z = [1:S(3)];

[XX,YY,ZZ] = meshgrid(x, y, z);

X = XX(:);
Y = YY(:);
Z = ZZ(:);

nframes = S(5);

% Write out one animation frame per file
for frame = 1:nframes

    outfile = sprintf('%s%03d.dat', basename, frame);

    % Get the vectors themselves
    dx = vf(:,:,:,1,frame)(:);
    dy = vf(:,:,:,2,frame)(:);
    dz = vf(:,:,:,3,frame)(:);

    % Prepare the output matrix
    output = [X,Y,Z,dx,dy,dz];
    format = '%d %d %d %f %f %f\n';

    % If there is an extra (colour) field, print it out as the 7th column
    if (S(4) > 3)
        colour = vf(:,:,:,4,frame)(:);
        output = [output, colour];
        format = '%d %d %d %f %f %f %f\n';
    end % if

    % Write to file
    f = fopen(outfile, 'w');
    fprintf(f, 'x y z dx dy dz phase\n');
    fprintf(f, format, output');
    fclose(f);

end % for
