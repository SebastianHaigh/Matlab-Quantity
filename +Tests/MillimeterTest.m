classdef MillimeterTest < matlab.unittest.TestCase

    % Public methods of the Millimeter class are:
    %
    %   Millimeter - Class constructor
    %   add
    %   subtract
    %   get
    %   convert_meter

    properties
        MM1
        MM2
    end

    methods (TestMethodSetup)
        function setup_test(testCase)
            import Quantity.Millimeter
            
            testCase.MM1 = Millimeter(10000);
            testCase.MM2 = Millimeter(5000);
        end
    end

    methods (Test)
        function test_get(testCase)
            testCase.verifyEqual(testCase.MM1.get(), 10000);
        end

        function test_meter_conversion(testCase)
            M = testCase.MM1.convert_meter();
            testCase.verifyClass(M, 'Quantity.Meter');
            testCase.verifyEqual(M.get(), 10);
        end

        function test_addition_syntax_1(testCase)
            MM3 = add(testCase.MM1, testCase.MM2);
            testCase.verifyClass(MM3, 'Quantity.Millimeter');
            testCase.verifyEqual(testCase.MM1.get(), 10000);
            testCase.verifyEqual(testCase.MM2.get(), 5000);
            testCase.verifyEqual(MM3.get(), 15000);
        end

        function test_addition_syntax_2(testCase)
            MM3 = testCase.MM1.add(testCase.MM2);
            testCase.verifyClass(MM3, 'Quantity.Millimeter');
            testCase.verifyEqual(testCase.MM1.get(), 10000);
            testCase.verifyEqual(testCase.MM2.get(), 5000);
            testCase.verifyEqual(MM3.get(), 15000);
        end

        function test_subtraction_syntax_1(testCase)
            MM3 = subtract(testCase.MM1, testCase.MM2);
            MM4 = subtract(testCase.MM2, testCase.MM1);
            testCase.verifyClass(MM3, 'Quantity.Millimeter');
            testCase.verifyClass(MM4, 'Quantity.Millimeter');
            testCase.verifyEqual(testCase.MM1.get(), 10000);
            testCase.verifyEqual(testCase.MM2.get(), 5000);
            testCase.verifyEqual(MM3.get(), 5000);
            testCase.verifyEqual(MM4.get(), -5000);
        end

        function test_subtraction_syntax_2(testCase)
            MM3 = testCase.MM1.subtract(testCase.MM2);
            MM4 = testCase.MM2.subtract(testCase.MM1);
            testCase.verifyClass(MM3, 'Quantity.Millimeter');
            testCase.verifyClass(MM4, 'Quantity.Millimeter');
            testCase.verifyEqual(testCase.MM1.get(), 10000);
            testCase.verifyEqual(testCase.MM2.get(), 5000);
            testCase.verifyEqual(MM3.get(), 5000);
            testCase.verifyEqual(MM4.get(), -5000);
        end
    end

end