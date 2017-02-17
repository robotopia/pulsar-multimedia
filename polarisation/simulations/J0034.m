% This script generates simulated data that is supposed to look like the
% single-pulse polarisation data of J0034-0721 (B0031-07), as judged by the
% description in Manchester et al (1975).

npulses = 50;
dr      = -1.3; % drift rate (degrees per pulse)
phases  = [-30:0.25:30]; % in degrees
nphases = length(phases);
pulses  = [1:npulses];
spw     = 1.0; % FWHM of subpulses in degrees
sps     = 10; % P2 (degrees)

% Function to generate subpulses given a "subpulse phase"
function res = spshape(phase, centralphase, FWHM, separation)
    minp = min(phase(:));
    maxp = max(phase(:));

    mini = -floor((centralphase - minp) ./ separation);
    maxi =  ceil((maxp - centralphase) ./ separation);

    res = zeros(size(phase));
    for c = [mini:maxi]
        res += normpdf(phase, c*separation, FWHM);
        %imagesc(res); axis("xy"); drawnow();
    end % for
end % function

% Function that translates "subpulse phase" (0-1)
%                       to "polarisation angle" (0-180)
% (This function is designed to emulate J0034-0721)
function res = sp2pa(sp)
    ph = mod(sp+0.5, 1)-0.5;
    transitionpoint = 0.10;
    transitionrate  = 300;
    res = 1./(1+exp(-((ph+transitionpoint)*transitionrate))) * 90;
end % function

% Set-up output matrix (pulsestack)
ps = zeros(npulses, nphases);
[PHS, PLS] = meshgrid(phases, pulses);

Profile = normpdf(PHS, 0, 3);
SPPhase = mod(PHS - dr.*PLS, sps);
SPs     = spshape(SPPhase, 0.0, spw, sps);

PolPA   = sp2pa(SPPhase ./ sps);

% Add some noise to both the power and the polarisation
Inoiselevel = 0.002;
I = SPs .* Profile + randn(npulses, nphases)*Inoiselevel;
I /= 0.25*max(I(:));

PAnoiselevel = 5;
PA = mod(PolPA + randn(npulses, nphases)*PAnoiselevel + 90, 180) - 90;

% Fill in the rest of the needed columns
Q     = zeros(npulses, nphases);
U     = zeros(npulses, nphases);
V     = zeros(npulses, nphases);
PAerr = zeros(npulses, nphases);
chan  = zeros(npulses, nphases);
[phasebin, PLS] = meshgrid([0:nphases-1],pulses);

% Output the results (in the same format as pdv -Z)
% (pulse, chan, phasebin, I, Q, U, V, PA, PAerr)

output = [PLS'(:)-1, chan'(:), phasebin'(:), I'(:), Q'(:), U'(:), V'(:), PA'(:), PAerr'(:)];

printf('%d %d %d %f %f %f %f %f %f\n', output');



