classdef Meter
    % Meter Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = private)
        value
    end
    
    methods (Access = public)
        function self = Meter(meters)
            % Meter
            %
            %   M = Meter(V)

            self.value = meters;
        end

        function self = add(self, len)
            % Meter.add Returns the sum of this length with another
            % length.
            %
            %   M = Meter.add(L) returns an object M of type
            %   Meter whose length is the sum of the length that called 
            %   the method and the length L.
            %
            %   SEE ALSO: subtract

            self.value = self.value + len.get();
        end

        function self = subtract(self, len)
            % Meter.subtract Returns the difference between this point
            % and another point.
            %
            %   M = Meter.subtract(L) returns an object M of type
            %   Meter whose length is the difference of the length that 
            %   called the method and the length L.
            %
            %   SEE ALSO: add
            self.value = self.value - len.get();
        end
        
        function meters = get(self)
            % Meter.get
            %
            %   M = Meter.get()

            meters = self.value;
        end
        
        function meters = convert_millimeter(self)
            % Meter.convert_millimeter
            %
            %   MM = Meter.convert_millimeter()
            import Quantity.Millimeter
            
            meters = Millimeter(self.value*1000);
        end
    end
end