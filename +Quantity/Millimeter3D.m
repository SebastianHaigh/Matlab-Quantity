classdef Millimeter3D
    % Millimeter3D A class that hold a three dimensional position vector
    % specified in units of millimeters.
    %
    %   Millimeter3D Methods:
    %       Millimeter3D - Class constructor.
    %       distance - returns the distance between this point and another
    %       point
    %       add - add a point to this point
    %       subtract - subtracts a point from this point
    %       get_x - returns the x coordinate of the point
    %       get_y - returns the y coordinate of the point
    %       get_z - returns the z coordinate of the point
    %       get_vector - returns a (3,1) double containing the coordinates
    %       of the point.

    properties (Access = private)
        x (1,1) double
        y (1,1) double
        z (1,1) double
    end

    methods (Access = public)
        function self = Millimeter3D(x, y, z)
            % Millimeter3D Creates an instance of the Millimeter3D class.
            %
            %   P = Millimeter3D(X, Y, Z) creates an instance of the Millimeter3D
            %   class (P) with x, y, z coordinates at X, Y, and Z.

            self.x = x;
            self.y = y;
            self.z = z;
        end

        function result = distance(self, point)
            % Millimeter3D.distance Returns the distance between this point
            % and another point.
            %
            %   D = Millimeter3D.distance(P) returns a distance D that is
            %   the Euclidean distance between this point and the point P,
            %   where the point P is provided as another instance of the
            %   the class Simulation.Environment.Millimeter3D.
            import Length.Millimeter

            if nargin > 1
                dist = (self.x - point.get_x())^2;
                dist = dist + (self.y - point.get_y())^2;
                dist = dist + (self.z - point.get_z())^2;
                dist = sqrt(dist);
            else
                dist = sqrt(self.x^2 + self.y^2 + self.z^2);
            end
            result = Millimeter(dist);
        end

        function self = add(self, point)
            % Millimeter3D.add Returns the sum of this point with another
            % point.
            %
            %   M = Millimeter3D.add(P) returns an object M of type
            %   Millimeter3D whose position is the sum of the point that called 
            %   the method and the point P.
            %
            %   SEE ALSO: subtract

            self.x = self.x + point.get_x();
            self.y = self.y + point.get_y();
            self.z = self.z + point.get_z();
        end

        function self = subtract(self, point)
            % Millimeter3D.subtract Returns the difference between this point
            % and another point.
            %
            %   M = Millimeter3D.subtract(P) returns an object M of type
            %   Millimeter3D whose position is the difference of the point that 
            %   called the method and the point P.
            %
            %   SEE ALSO: add

            self.x = self.x - point.get_x();
            self.y = self.y - point.get_y();
            self.z = self.z - point.get_z();
        end

        function x = get_x(self)
            % Millimeter3D.get_x Returns a the value of this point's x
            % coordinate.
            %
            %   X = Millimeter3D.get_x() returns a double (X) containing the
            %   value of this point's x coordinate.
            %
            %   SEE ALSO: get_y, get_z, get

            x = self.x;
        end

        function y = get_y(self)
            % Millimeter3D.get_y Returns a the value of this point's y
            % coordinate.
            %
            %   Y = Millimeter3D.get_y() returns a double (Y) containing the
            %   value of this point's y coordinate.
            %
            %   SEE ALSO: get_x, get_z, get

            y = self.y;
        end

        function z = get_z(self)
            % Millimeter3D.get_z Returns a the value of this point's z
            % coordinate.
            %
            %   Z = Millimeter3D.get_z() returns a double (Z) containing the
            %   value of this point's z coordinate.
            %
            %   SEE ALSO: get_x, get_y, get

            z = self.z;
        end

        function vector = get(self)
            % Millimeter3D.get Returns a the 3D vector
            %
            %   V = Millimeter3D.get() returns a (3,1) double (V)
            %   containing the value of this point's x, y, and z coordinates.
            %
            %   SEE ALSO: get_x, get_y, get_z

            vector = [self.x; self.y; self.z];
        end

        function meter = convert_meter(self)
            import Length.Meter3D

            meter = Meter3D(self.x/1000, self.y/1000, self.z/1000);
        end
    end

end
