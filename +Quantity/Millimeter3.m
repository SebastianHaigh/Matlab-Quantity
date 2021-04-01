classdef Millimeter3 < Length3

    properties (Access = private)
        point Point3
    end

    methods (Access = public)
        function self = Millimeter3(varargin)
            if nargin == 3
                self.point = Point3(varargin{1}, varargin{2}, varargin{3});
            elseif nargin == 1
                self.point = varargin{1};
            else
            end
        end

        function output = get_x(self)
            output = self.point.get_x();
        end

        function output = get_y(self)
            output = self.point.get_y();
        end

        function output = get_z(self)
            output = self.point.get_z();
        end

        function output = get(self)
            output = self.point.get();
        end

        function add()
        end

        function sub()
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
                output = self.point.distance(point);
            else
                output = self.point.distance();
            end

        end
    end
end
