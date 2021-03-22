classdef Millimeter
    %MILLIMETER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = private)
        value
    end
    
    methods (Access = public)
        function self = Millimeter(millimeters)
            % Millimeter Construct an instance of this class
            %
            %   M = Millimeter(V)
            
            self.value = millimeters;
        end
        
        function self = add(self, len)
            % Millimeter.add Returns the sum of this length with another
            % length.
            %
            %   M = Millimeter.add(L) returns an object M of type
            %   Millimeter whose length is the sum of the length that called 
            %   the method and the length L.
            %
            %   SEE ALSO: subtract

            self.value = self.value + len.get();
        end

        function self = subtract(self, len)
            % Millimeter.subtract Returns the difference between this point
            % and another point.
            %
            %   M = Millimeter.subtract(L) returns an object M of type
            %   Millimeter whose length is the difference of the length that 
            %   called the method and the length L.
            %
            %   SEE ALSO: add
            self.value = self.value - len.get();
        end

        function millimeters = get(self)
            % Millimeter.get 
            %
            %   M = Millimeter.get()

            millimeters = self.value;
        end
        
        function meters = convert_meter(self)
            % Millimeter.convert_meter 
            %
            %   M = Millimeter.convert_meter()
            import Quantity.Meter
            
            meters = Meter(self.value/1000);
        end
    end
end

