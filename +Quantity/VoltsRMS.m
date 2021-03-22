classdef VoltsRMS
    %VOLTSRMS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        voltage (1,1) double
    end
    
    methods
        function self = VoltsRMS(voltage)
            %VOLTSRMS Construct an instance of this class
            %   Detailed explanation goes here
            self.voltage = voltage;
        end
        
        function voltage = get_voltage(self)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            voltage = self.voltage;
        end
    end
end

