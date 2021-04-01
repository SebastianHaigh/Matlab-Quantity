classdef SecondTest < matlab.unittest.TestCase

    % Public methods of the Second class are:
    %
    %   Second - Class constructor
    %   get
    %   convert_sample
    %   convert_millisecond

    properties
        S
        SR
    end

    methods (TestMethodSetup)
        function setup_test(testCase)
            import Quantity.Second
            import Quantity.SamplesPerSecond

            testCase.S = Second(10);
            testCase.SR = SamplesPerSecond(1000);
        end
    end

    methods (Test)
        function test_get(testCase)
            testCase.verifyEqual(testCase.S.get(), 10);
        end

        function test_convert_sample(testCase)
            SP = testCase.S.convert_sample(testCase.SR);
            testCase.verifyEqual(SP.get(), 10000);
        end

        function test_convert_millisecond(testCase)
            MS = testCase.S.convert_millisecond();
            testCase.verifyEqual(MS.get(), 10000);
        end
    end
end