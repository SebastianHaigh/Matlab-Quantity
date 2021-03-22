classdef Meter3D < matlab.unittest.TestCase

    % Public methods of the Meter3D class are:
    %
    %   Meter3D - Class constructor
    %   add
    %   subtract
    %   get
    %   convert_meter

    properties
        M1
        M2
    end

    methods (TestMethodSetup)
        function setup_test(testCase)
            import Quantity.Length.Meter3D
            
            testCase.M1 = Meter3D(1000, 2000, 3000);
            testCase.M2 = Meter3D(1, 2, 3);
        end
    end

    methods (Test)
        function test_get(testCase)
            testCase.verifyEqual(testCase.M1.get(), [1000; 2000; 3000]);
            testCase.verifyEqual(testCase.M2.get(), [1; 2; 3]);
        end

        function test_get_axis(testCase)
            testCase.verifyEqual(testCase.M1.get_x(), 1000);
            testCase.verifyEqual(testCase.M1.get_y(), 2000);
            testCase.verifyEqual(testCase.M1.get_z(), 3000);
            testCase.verifyEqual(testCase.M2.get_x(), 1);
            testCase.verifyEqual(testCase.M2.get_y(), 2);
            testCase.verifyEqual(testCase.M2.get_z(), 3);
        end

        function test_distance_with_input_syntax_1(testCase)
            M3 = distance(testCase.M1, testCase.M2);
            M4 = distance(testCase.M2, testCase.M1);
            testCase.verifyClass(M3, 'Quantity.Length.Meter');
            testCase.verifyClass(M4, 'Quantity.Length.Meter');
            testCase.verifyEqual(M3.get(), M4.get());
            testCase.verifyEqual(M3.get(), 3737.915729387168, 'AbsTol', 10^-6);
            testCase.verifyEqual(M4.get(), 3737.915729387168, 'AbsTol', 10^-6);
        end

        function test_distance_without_input_syntax_1(testCase)
            M3 = distance(testCase.M1);
            M4 = distance(testCase.M2);
            testCase.verifyClass(M3, 'Quantity.Length.Meter');
            testCase.verifyClass(M4, 'Quantity.Length.Meter');
            testCase.verifyEqual(M3.get(), 3741.657386773941, 'AbsTol', 10^-6);
            testCase.verifyEqual(M4.get(), 3.741657386773941, 'AbsTol', 10^-6);
        end

        function test_distance_with_input_syntax_2(testCase)
            M3 = testCase.M1.distance(testCase.M2);
            M4 = testCase.M2.distance(testCase.M1);
            testCase.verifyClass(M3, 'Quantity.Length.Meter');
            testCase.verifyClass(M4, 'Quantity.Length.Meter');
            testCase.verifyEqual(M3.get(), M4.get());
            testCase.verifyEqual(M3.get(), 3737.915729387168, 'AbsTol', 10^-6);
            testCase.verifyEqual(M4.get(), 3737.915729387168, 'AbsTol', 10^-6);
        end

        function test_distance_without_input_syntax_2(testCase)
            M3 = testCase.M1.distance();
            M4 = testCase.M2.distance();
            testCase.verifyClass(M3, 'Quantity.Length.Meter');
            testCase.verifyClass(M4, 'Quantity.Length.Meter');
            testCase.verifyEqual(M3.get(), 3741.657386773941, 'AbsTol', 10^-6);
            testCase.verifyEqual(M4.get(), 3.741657386773941, 'AbsTol', 10^-6);
        end

        function test_millimeter_conversion(testCase)
            MM1 = testCase.M1.convert_millimeter();
            MM2 = testCase.M2.convert_millimeter();
            testCase.verifyClass(MM1, 'Quantity.Length.Millimeter3D');
            testCase.verifyClass(MM2, 'Quantity.Length.Millimeter3D');
            testCase.verifyEqual(MM1.get(), [1000000; 2000000; 3000000]);
            testCase.verifyEqual(MM2.get(), [1000; 2000; 3000]);
        end

        function test_addition_syntax_1(testCase)
            M3 = add(testCase.M1, testCase.M2);
            testCase.verifyClass(M3, 'Quantity.Length.Meter3D');
            testCase.verifyEqual(testCase.M1.get(), [1000; 2000; 3000]);
            testCase.verifyEqual(testCase.M2.get(), [1; 2; 3]);
            testCase.verifyEqual(M3.get(), [1001; 2002; 3003]);
        end

        function test_addition_syntax_2(testCase)
            M3 = testCase.M1.add(testCase.M2);
            testCase.verifyClass(M3, 'Quantity.Length.Meter3D');
            testCase.verifyEqual(testCase.M1.get(), [1000; 2000; 3000]);
            testCase.verifyEqual(testCase.M2.get(), [1; 2; 3]);
            testCase.verifyEqual(M3.get(), [1001; 2002; 3003]);
        end

        function test_subtraction_syntax_1(testCase)
            M3 = subtract(testCase.M1, testCase.M2);
            M4 = subtract(testCase.M2, testCase.M1);
            testCase.verifyClass(M3, 'Quantity.Length.Meter3D');
            testCase.verifyClass(M4, 'Quantity.Length.Meter3D');
            testCase.verifyEqual(testCase.M1.get(), [1000; 2000; 3000]);
            testCase.verifyEqual(testCase.M2.get(), [1; 2; 3]);
            testCase.verifyEqual(M3.get(), [999; 1998; 2997]);
            testCase.verifyEqual(M4.get(), [-999; -1998; -2997]);
        end

        function test_subtraction_syntax_2(testCase)
            M3 = testCase.M1.subtract(testCase.M2);
            M4 = testCase.M2.subtract(testCase.M1);
            testCase.verifyClass(M3, 'Quantity.Length.Meter3D');
            testCase.verifyClass(M4, 'Quantity.Length.Meter3D');
            testCase.verifyEqual(testCase.M1.get(), [1000; 2000; 3000]);
            testCase.verifyEqual(testCase.M2.get(), [1; 2; 3]);
            testCase.verifyEqual(M3.get(), [999; 1998; 2997]);
            testCase.verifyEqual(M4.get(), [-999; -1998; -2997]);
        end
    end

end