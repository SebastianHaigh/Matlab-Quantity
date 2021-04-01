classdef Meter < matlab.unittest.TestCase

    % Public methods of the Meter class are:
    %
    %   Meter - Class constructor
    %   get
    %   add
    %   subtract
    %   convert_millimeter

    properties
        M1
        M2
    end

    methods (TestMethodSetup)
        function setup_test(testCase)
            import Length.Meter
            testCase.M1 = Meter(10000);
            testCase.M2 = Meter(5000);
        end
    end

    methods (Test)
        function test_get(testCase)
            testCase.verifyEqual(testCase.M1.get(), 10000);
            testCase.verifyEqual(testCase.M2.get(), 5000);
        end

        function test_millimeter_conversion(testCase)
            MM = testCase.M1.convert_millimeter();
            testCase.verifyClass(MM, 'Length.Millimeter');
            testCase.verifyEqual(MM.get(), 10000000);
        end

        function test_addition_syntax_1(testCase)
            M3 = add(testCase.M1, testCase.M2);
            testCase.verifyClass(M3, 'Length.Meter');
            testCase.verifyEqual(testCase.M1.get(), 10000);
            testCase.verifyEqual(testCase.M2.get(), 5000);
            testCase.verifyEqual(M3.get(), 15000);
        end

        function test_addition_syntax_2(testCase)
            M3 = testCase.M1.add(testCase.M2);
            testCase.verifyClass(M3, 'Length.Meter');
            testCase.verifyEqual(testCase.M1.get(), 10000);
            testCase.verifyEqual(testCase.M2.get(), 5000);
            testCase.verifyEqual(M3.get(), 15000);
        end

        function test_subtraction_syntax_1(testCase)
            M3 = subtract(testCase.M1, testCase.M2);
            M4 = subtract(testCase.M2, testCase.M1);
            testCase.verifyClass(M3, 'Length.Meter');
            testCase.verifyClass(M4, 'Length.Meter');
            testCase.verifyEqual(testCase.M1.get(), 10000);
            testCase.verifyEqual(testCase.M2.get(), 5000);
            testCase.verifyEqual(M3.get(), 5000);
            testCase.verifyEqual(M4.get(), -5000);
        end

        function test_subtraction_syntax_2(testCase)
            M3 = testCase.M1.subtract(testCase.M2);
            M4 = testCase.M2.subtract(testCase.M1);
            testCase.verifyClass(M3, 'Length.Meter');
            testCase.verifyClass(M4, 'Length.Meter');
            testCase.verifyEqual(testCase.M1.get(), 10000);
            testCase.verifyEqual(testCase.M2.get(), 5000);
            testCase.verifyEqual(M3.get(), 5000);
            testCase.verifyEqual(M4.get(), -5000);
        end

    end

end