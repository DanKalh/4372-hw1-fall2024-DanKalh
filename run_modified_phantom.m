% run_modified_phantom.m
% This script defines the variables and calls the modified_phantom function
% to generate and display a custom phantom image.

% Clear workspace, close figures, and clear command window
clear;
clc;
close all;

% Define the phantom matrix size (N x N)
N = 256;

% Define the number of ellipses (M)
M = 3;

% Define the center positions of the ellipses (X, Y coordinates)
center_positions = [
    0,     0;                    % Ellipse 1     (skull)
    0, -0.0184;                  % Ellipse 2     (brain)
    0.15,  0.05;                 % Ellipse 3     (tumor)
];

% Define the rotation angles of the ellipses (in degrees)
rotation_angles = [0, 0, 0];

% Define the sizes of the ellipses [width, height]
sizes = [
    0.69, 0.92;     % Ellipse 1
    0.6624, 0.874;  % Ellipse 2
    0.21, 0.25;     % Ellipse 3
];

% Define the signal intensities of the ellipses
signal_intensities = [1, -0.8, 0.1];

% Call the modified_phantom function to generate the phantom
phantom_image = modified_phantom(N, M, center_positions, rotation_angles, sizes, signal_intensities);

% Display the phantom image
figure;
imshow(phantom_image, []);
title('Modified Phantom Image');
