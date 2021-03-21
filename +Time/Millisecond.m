classdef Millisecond
    %MILLISECONDS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        time (1,1) double
    end
    
    methods
        function self = Millisecond(time)
            %MILLISECONDS Construct an instance of this class
            %   Detailed explanation goes here
            self.time = time;
        end
        
        function time = get(self)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            time = self.time;
        end
        
        function samples = convert_sample(self, sample_rate)
            import Quantity.Time.Sample

            seconds = self.convert_second();
            number_of_samples = seconds.get() * sample_rate.get();
            samples = Sample(number_of_samples, sample_rate.convert_period());
        end
        
        function seconds = convert_second(self)
            import Quantity.Time.Second
            
            seconds = Second(self.time / 1000);
        end
    end
end

