classdef Point3

    properties %(Access = private)
        x (1, 1) double
        y (1, 1) double
        z (1, 1) double
    end

    methods (Access = public)
        function self = Point3(varargin)
            if nargin == 3
                self = self.arrange_inputs(varargin{1}, varargin{2}, varargin{3});
            elseif nargin == 1
                self = self.check_and_arrange_single_arguement_input(varargin{1});
            else
                error_id = 'Point3:InvalidInput';
                error_msg = 'Arguments must either be 3 individual components (x,y,z) or a vector of length 3 (column or row).';
                error(error_id, error_msg);
            end
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
            if nargin > 1
                output = (self.x - point.get_x())^2;
                output = output + (self.y - point.get_y())^2;
                output = output + (self.z - point.get_z())^2;
                output = sqrt(output);
            else
                output = sqrt(self.x^2 + self.y^2 + self.z^2);
            end
        end

        function output = add(self, point)
            import Quantity.Point3
            new_position = self.get() + point.get();
            output = Point3(new_position(1), new_position(2), new_position(3));
        end

        function output = sub(self, point)
            import Quantity.Point3
            new_position = self.get() - point.get();
            output = Point3(new_position(1), new_position(2), new_position(3));
        end
    end

    methods (Access = private)
        function self = check_and_arrange_single_arguement_input(self, argument)

            if length(argument) == 3
                self = self.arrange_inputs(argument(1), argument(2), argument(3));
            else
                error_id = 'Point3:InvalidInput';
                error_msg = 'Single argument input must be either column or row vector of length 3.';
                error(error_id, error_msg);
            end
        end

        function self = arrange_inputs(self, x, y, z)
            self.x = x;
            self.y = y;
            self.z = z;
        end
    end

end