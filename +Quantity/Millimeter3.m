classdef Millimeter3 < Quantity.Length3

    properties (Access = private)
        point Quantity.Point3
    end

    methods (Access = public)
        function self = Millimeter3(varargin)
            import Quantity.Point3
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
            if nargin > 1
                output = self.point.distance(point);
            else
                output = self.point.distance();
            end

        end
    end
end
