classdef Meter3D
    %METER3D Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        x (1,1) double
        y (1,1) double
        z (1,1) double
    end
    
    methods
        function self = Meter3D(x, y, z)
            % Meter3D Creates an instance of the Meter3D class.
            %
            %   P = Meter3D(X, Y, Z) creates an instance of the Meter3D
            %   class (P) with x, y, z coordinates at X, Y, and Z.

            self.x = x;
            self.y = y;
            self.z = z;
        end
        
        function result = distance(self, point)
            % Meter3D.distance Returns the distance between this point
            % and another point.
            %
            %   D = Meter3D.distance(P) returns a distance D that is
            %   the Euclidean distance between this point and the point P,
            %   where the point P is provided as another instance of the
            %   the class Simulation.Environment.Meter3D.
            %
            %   D = Meter3D.distance() returns the length of the Meter3D vector,
            %   or its distance from the origin
            import Quantity.Meter
            if nargin > 1
                dist = (self.x - point.get_x())^2;
                dist = dist + (self.y - point.get_y())^2;
                dist = dist + (self.z - point.get_z())^2;
                dist = sqrt(dist);
            else
                dist = sqrt(self.x^2 + self.y^2 + self.z^2);
            end
            result = Meter(dist);

        end

        function self = add(self, point)
            % Meter3D.add Returns the sum of this point with another
            % point.
            %
            %   M = Meter3D.add(P) returns an object M of type
            %   Meter3D whose position is the sum of the point that called 
            %   the method and the point P.
            %
            %   SEE ALSO: subtract

            self.x = self.x + point.get_x();
            self.y = self.y + point.get_y();
            self.z = self.z + point.get_z();
        end

        function self = subtract(self, point)
            % Meter3D.subtract Returns the difference between this point
            % and another point.
            %
            %   M = Meter3D.subtract(P) returns an object M of type
            %   Meter3D whose position is the difference of the point that 
            %   called the method and the point P.
            %
            %   SEE ALSO: add

            self.x = self.x - point.get_x();
            self.y = self.y - point.get_y();
            self.z = self.z - point.get_z();
        end

        function x = get_x(self)
            % Meter3D.get_x Returns a the value of this point's x
            % coordinate.
            %
            %   X = Meter3D.get_x() returns a double (X) containing the
            %   value of this point's x coordinate.
            %
            %   SEE ALSO: get_y, get_z, get

            x = self.x;
        end

        function y = get_y(self)
            % Meter3D.get_y Returns a the value of this point's y
            % coordinate.
            %
            %   Y = Meter3D.get_y() returns a double (Y) containing the
            %   value of this point's y coordinate.
            %
            %   SEE ALSO: get_x, get_z, get

            y = self.y;
        end

        function z = get_z(self)
            % Meter3D.get_z Returns a the value of this point's z
            % coordinate.
            %
            %   Z = Meter3D.get_z() returns a double (Z) containing the
            %   value of this point's z coordinate.
            %
            %   SEE ALSO: get_x, get_y, get

            z = self.z;
        end

        function vector = get(self)
            % Meter3D.get Returns a the 3D vector
            %
            %   V = Meter3D.get() returns a (3,1) double (V)
            %   containing the value of this point's x, y, and z coordinates.
            %
            %   SEE ALSO: get_x, get_y, get_z

            vector = [self.x; self.y; self.z];
        end

        function meter = convert_millimeter(self)
            import Quantity.Millimeter3D
            
            meter = Millimeter3D(self.x*1000, self.y*1000, self.z*1000);
        end
    end
end

