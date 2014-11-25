function draw_camera(object)

figure;
hold on;
[P, C] = projection(object.viewpoint.azimuth, object.viewpoint.elevation, object.viewpoint.distance);
theta = atan2(C(1), -C(2));
R = angle2dcm(theta, 0*pi/180, -90*pi/180);
R_c2w = inv(R);
T_c2w = C;
CameraVertex = zeros(5,3);
CameraVertex(1,:) = [0 0 0];
CameraVertex(2,:) = [-0.2  0.2  0.50];
CameraVertex(3,:) = [ 0.2  0.2  0.50];
CameraVertex(4,:) = [-0.2 -0.2  0.50];
CameraVertex(5,:) = [ 0.2 -0.2  0.50];
CameraVertex = ([R_c2w T_c2w]*[(CameraVertex');ones(1,5)])';
IndSetCamera = {[1 2 3 1] [1 4 2 1] [1 5 4 1] [1 5 3 1] [2 3 5 4 2]};
for iter_indset = 1:length(IndSetCamera)
    patch('Faces', IndSetCamera{iter_indset}, 'Vertices', CameraVertex, 'FaceColor', 'b', 'FaceAlpha', 0.5);           
end
hold off;