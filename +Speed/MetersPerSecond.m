classdef MetersPerSecond
    %METERSPERSECOND Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = private)
        value
    end
    
    methods
        function self = MetersPerSecond(speed)
            %METERSPERSECOND Construct an instance of this class
            %   Detailed explanation goes here
            self.value = speed;
        end
        
        function meters_per_second = get(self)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            meters_per_second = self.value;
        end
        
        function meters = convert_meter(self, seconds)
            import Length.Meter

            meters = Meter(self.value * seconds.get());
        end

        function seconds = convert_second(self, meters)
            import Time.Second

            seconds = Second(meters.get() / self.value);
        end
    end
end

