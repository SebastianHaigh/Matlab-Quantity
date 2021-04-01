classdef SamplesPerSecondTest < matlab.unittest.TestCase

    % Public methods of the SamplesPerSecond class are:
    %
    %   SamplesPerSecond - Class constructor
    %   get
    %   convert_period

    methods (TestMethodSetup)
        function setup_test(testCase)
            
        end
    end

    methods (Test)
        function test_get(testCase)
            import Frequency.SamplesPerSecond
            H = SamplesPerSecond(10000);
            testCase.verifyEqual(H.get(), 10000);
        end

        function test_period_conversion(testCase)
            import Frequency.SamplesPerSecond
            H = SamplesPerSecond(10000);
            P = H.convert_period();
            testCase.verifyClass(P, 'Time.Second');
            testCase.verifyEqual(P.get(), 0.0001);
        end

    end

end