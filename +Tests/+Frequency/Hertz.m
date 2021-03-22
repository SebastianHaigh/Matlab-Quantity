classdef Hertz < matlab.unittest.TestCase

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
            
            H = Hertz(10000);
            testCase.verifyEqual(H.get(), 10000);
        end

        function test_period_conversion(testCase)

            H = Hertz(10000);
            P = H.convert_period();
            testCase.verifyClass(P, 'Second');
            testCase.verifyEqual(P.get(), 0.0001);
        end

    end

end