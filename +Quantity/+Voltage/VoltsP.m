classdef VoltsP
    %VOLTSP Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Property1
    end
    
    methods
        function self = VoltsP(inputArg1,inputArg2)
            %VOLTSP Construct an instance of this class
            %   Detailed explanation goes here
            self.Property1 = inputArg1 + inputArg2;
        end
        
        function outputArg = method1(self,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = self.Property1 + inputArg;
        end
    end
end

