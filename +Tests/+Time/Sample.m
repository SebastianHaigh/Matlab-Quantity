classdef Sample < matlab.unittest.TestCase

    % Public methods of the Sample class are:
    %
    %   Sample - Class constructor
    %   get
    %   convert_second
    %   convert_millisecond

    properties
        SP
        SR
    end

    methods (TestMethodSetup)
        function setup_test(testCase)
            import Quantity.SamplesPerSecond
            import Quantity.Sample
            testCase.SR = SamplesPerSecond(1000);
            testCase.SP = Sample(1000, testCase.SR.convert_period());
        end
    end

    methods (Test)
        function test_get(testCase)
            testCase.verifyEqual(testCase.SP.get(), 1000);
        end

        function test_convert_seconds(testCase)
            S = testCase.SP.convert_second();
            testCase.verifyEqual(S.get(), 1);
        end

        function test_convert_millisecond(testCase)
            MS = testCase.SP.convert_millisecond();
            testCase.verifyEqual(MS.get(), 1000);
        end
    end
end