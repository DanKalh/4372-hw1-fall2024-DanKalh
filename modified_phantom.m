function phantom_image = dynamic_phantom(N, M, center_positions, rotation_angles, sizes, signal_intensities)
    % modified_phantom: Generate a custom phantom with dynamic number of ellipses.
    %   Inputs:
    %       N               - Phantom matrix size (NxN).
    %       M               - Number of ellipses.
    %       center_positions - Mx2 matrix, where each row is [X, Y] for ellipse center.
    %       rotation_angles  - Mx1 vector, each element is the rotation angle (in degrees).
    %       sizes            - Mx2 matrix, where each row is [width, height] of the ellipse.
    %       signal_intensities - Mx1 vector, signal intensity of each ellipse.
    %
    %   Outputs:
    %       phantom_image    - The generated phantom image.

    % Initialize the phantom matrix to zeros
    phantom_image = zeros(N);
    
    % Generate x and y axis grids that span [-1, 1]
    x_axis = ((0:N-1) - (N-1)/2) / ((N-1)/2);
    x_grid = repmat(x_axis, N, 1);   % X coordinates
    y_grid = rot90(x_grid);          % Y coordinates
    
    % Loop through each ellipse and add it to the phantom
    for k = 1:M
        % Extract ellipse properties for the current ellipse
        center_x = center_positions(k, 1);
        center_y = center_positions(k, 2);
        rotation_angle = rotation_angles(k);
        semi_axis_a = sizes(k, 1) / 2;  % Horizontal semi-axis (width / 2)
        semi_axis_b = sizes(k, 2) / 2;  % Vertical semi-axis (height / 2)
        signal_intensity = signal_intensities(k);

        % Convert rotation angle to radians
        rotation_angle_rad = rotation_angle * pi / 180;

        % Shift the x and y grids by the ellipse center position
        x_shifted = x_grid - center_x;
        y_shifted = y_grid - center_y;

        % Rotate the coordinates based on the rotation angle
        x_rotated = x_shifted * cos(rotation_angle_rad) + y_shifted * sin(rotation_angle_rad);
        y_rotated = -x_shifted * sin(rotation_angle_rad) + y_shifted * cos(rotation_angle_rad);

        % Equation of the ellipse (normalized form)
        ellipse_equation = (x_rotated.^2) / (semi_axis_a^2) + (y_rotated.^2) / (semi_axis_b^2);

        % Find pixels inside the ellipse (where equation is <= 1)
        ellipse_mask = ellipse_equation <= 1;

        % Add the ellipse to the phantom with the specified signal intensity
        phantom_image(ellipse_mask) = phantom_image(ellipse_mask) + signal_intensity;
    end
end
