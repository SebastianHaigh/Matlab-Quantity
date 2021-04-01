classdef HertzTest < matlab.unittest.TestCase

    % Public methods of the Hertz class are:
    %
    %   Hertz - Class constructor
    %   get_frequency 
    %   convert_period

    methods (TestMethodSetup)
        function setup_test(testCase)
            
        end
    end

    methods (Test)
        function test_get(testCase)
            import Frequency.Hertz
            
            H = Hertz(10000);
            testCase.verifyEqual(H.get(), 10000);
        end

        function test_period_conversion(testCase)
            import Frequency.Hertz

            H = Hertz(10000);
            P = H.convert_period();
            testCase.verifyClass(P, 'Time.Second');
            testCase.verifyEqual(P.get(), 0.0001);
        end

    end

end