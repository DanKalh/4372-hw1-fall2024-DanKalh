
% Define the phantom matrix size (N x N)
N = 512;

% Define the number of ellipses (M)
M = 7;

% Define the center positions of the ellipses (X, Y coordinates)
center_positions = [
    0,     0;                    % Ellipse 1     (skull)
    0, -0.0184;                  % Ellipse 2     (brain)
    0.12,  0.05;                 % Ellipse 3     (brain matter)
    -0.12,  0.05;                % Ellipse 4     (brain matter)
    0.0,  -0.25;                 % Ellipse 5     (tumor)
    -0.70,  -0.15;               % Ellipse 6     (reference1)
    -0.70,  -0.35;               % Ellipse 7     (reference2)
];

% Define the rotation angles of the ellipses (in degrees)
rotation_angles = [0, 0, -5, 20, 0.2, 0, 0];

% Define the sizes of the ellipses [width, height]
sizes = [
    0.69, 0.92;     % Ellipse 1 
    0.6624, 0.874;  % Ellipse 2 
    0.18, 0.45;     % Ellipse 3
    0.18, 0.35;     % Ellipse 4
    0.1, 0.1;       % Ellipse 5
    0.1, 0.1;       % Ellipse 6
    0.1, 0.1;       % Ellipse 7
];

% Define the signal intensities of the ellipses
signal_intensities = [1, -0.8, -0.1, -0.1, 0.15, 0.5, 0.5];

% Call the modified_phantom function to generate the phantom
phantom_image = modified_phantom(N, M, center_positions, rotation_angles, sizes, signal_intensities);

% Display the phantom image
figure;
imshow(phantom_image, []);
title('Phantom TWO');
