classdef Hertz
    % HERTZ Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        frequency
    end
    
    methods
        function self = Hertz(frequency)
            %HERTZ Construct an instance of this class
            %   Detailed explanation goes here
            self.frequency = frequency;
        end
        
        function frequency = get(self)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            frequency = self.frequency;
        end
        
        function seconds = convert_period(self)
            import Quantity.Second
            
            seconds = Second(1/self.frequency);
        end
    end
end

