classdef Second
    %SECONDS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        time (1,1) double
    end
    
    methods
        function self = Second(time)
            %SECONDS Construct an instance of this class
            %   Detailed explanation goes here
            self.time = time;
        end
        
        function time = get(self)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            time = self.time;
        end
        
        function samples = convert_sample(self, sample_rate)

            number_of_samples = round(self.time * sample_rate.get());
            samples = Sample(number_of_samples, sample_rate.convert_period());
        end
        
        function milliseconds = convert_millisecond(self)

            milliseconds = Millisecond(self.time * 1000);
        end
    end
end

