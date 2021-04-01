classdef MetersPerSecondTest < matlab.unittest.TestCase

    % Public methods of the MetersPerSecond class are:
    %
    %   MetersPerSecond - Class constructor
    %   get
    %   convert_distance
    %   convert_time

    properties
        MPS1
        MPS2
        M
        S
    end

    methods (TestMethodSetup)
        function setup_test(testCase)
            import Quantity.MetersPerSecond
            import Quantity.Second
            import Quantity.Meter
            
            testCase.MPS1 = MetersPerSecond(10);
            testCase.MPS2 = MetersPerSecond(5);
            testCase.M = Meter(10);
            testCase.S = Second(1);
        end
    end

    methods (Test)
        function test_get(testCase)
            testCase.verifyEqual(testCase.MPS1.get(), 10);
            testCase.verifyEqual(testCase.MPS2.get(), 5);
        end

        function test_convert_meter(testCase)
            M1 = testCase.MPS1.convert_meter(testCase.S);
            testCase.verifyEqual(M1.get(), 10);
        end

        function test_convert_second(testCase)
            S1 = testCase.MPS1.convert_second(testCase.M);
            testCase.verifyEqual(S1.get(), 1);
        end
    end
end