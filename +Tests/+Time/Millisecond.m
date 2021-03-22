classdef Millisecond < matlab.unittest.TestCase

    % Public methods of the Millisecond class are:
    %
    %   Millisecond - Class constructor
    %   get
    %   convert_sample
    %   convert_second

    properties
        MS
        SR
    end

    methods (TestMethodSetup)
        function setup_test(testCase)
            testCase.MS = Millisecond(10);
            testCase.SR = SamplesPerSecond(1000);
        end
    end

    methods (Test)
        function test_get(testCase)
            testCase.verifyEqual(testCase.MS.get(), 10);
        end

        function test_convert_sample(testCase)
            S = testCase.MS.convert_sample(testCase.SR);
            testCase.verifyEqual(S.get(), 10);
        end

        function test_convert_second(testCase)
            S = testCase.MS.convert_second();
            testCase.verifyEqual(S.get(), 0.01);
        end
    end
end