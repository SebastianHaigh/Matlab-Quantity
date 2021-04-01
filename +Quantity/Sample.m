classdef Sample
    %SAMPLES Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        number_of_samples
        period Quantity.Second
    end
    
    methods
        function self = Sample(number_of_samples, period)
            %SAMPLES Construct an instance of this class
            %   Detailed explanation goes here
            self.number_of_samples = number_of_samples;
            self.period = period;
        end
        
        function number_of_samples = get(self)
            number_of_samples = self.number_of_samples;
        end
        
        function seconds = convert_second(self)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            import Quantity.Second

            seconds = Second(self.number_of_samples * self.period.get());
        end
        
        function milliseconds = convert_millisecond(self)
            seconds = self.convert_second();
            milliseconds = seconds.convert_millisecond();
        end
    end
end

