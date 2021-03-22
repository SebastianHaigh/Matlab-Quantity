classdef Point3

    properties (Access = private)
        x (1, 1) double
        y (1, 1) double
        z (1, 1) double
    end

    methods (Access = public)
        function self = Point3(x, y, z)
            self.x = x;
            self.y = y;
            self.z = z;
        end

        function output = get_x(self)
            output = self.x;
        end

        function output = get_y(self)
            output = self.y;
        end

        function output = get_z(self)
            output = self.z;
        end

        function output = get(self)
            output = [self.x; self.y; self.z];
        end

        function output = distance(self, point)
            % Point3.distance Returns the distance between this point
            % and another point.
            %
            %   D = Point3.distance(P) returns a distance D that is
            %   the Euclidean distance between this point and the point P,
            %   where the point P is provided as another instance of the
            %   the Point3 class.
            %
            %   D = Point3.distance() returns a distance D that is
            %   the Euclidean distance between this point and the origin 
            %   ([0; 0; 0]).

            if nargin > 1
                output = (self.x - point.get_x())^2;
                output = output + (self.y - point.get_y())^2;
                output = output + (self.z - point.get_z())^2;
                output = sqrt(output);
            else
                output = sqrt(self.x^2 + self.y^2 + self.z^2);
            end
        end
    end

end