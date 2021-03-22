classdef Millimeter3D < matlab.unittest.TestCase

    % Public methods of the Millimeter3D class are:
    %
    %   Millimeter3D - Class constructor
    %   add
    %   subtract
    %   distance
    %   get
    %   convert_meter

    properties
        MM1
        MM2
    end

    methods (TestMethodSetup)
        function setup_test(testCase)
            import Millimeter3D
            
            testCase.MM1 = Millimeter3D(1000, 2000, 3000);
            testCase.MM2 = Millimeter3D(1, 2, 3);
        end
    end

    methods (Test)
        function test_get(testCase)
            testCase.verifyEqual(testCase.MM1.get(), [1000; 2000; 3000]);
            testCase.verifyEqual(testCase.MM2.get(), [1; 2; 3]);
        end

        function test_get_axis(testCase)
            testCase.verifyEqual(testCase.MM1.get_x(), 1000);
            testCase.verifyEqual(testCase.MM1.get_y(), 2000);
            testCase.verifyEqual(testCase.MM1.get_z(), 3000);
            testCase.verifyEqual(testCase.MM2.get_x(), 1);
            testCase.verifyEqual(testCase.MM2.get_y(), 2);
            testCase.verifyEqual(testCase.MM2.get_z(), 3);
        end

        function test_distance_with_input_syntax_1(testCase)
            MM3 = distance(testCase.MM1, testCase.MM2);
            MM4 = distance(testCase.MM2, testCase.MM1);
            testCase.verifyClass(MM3, 'Millimeter');
            testCase.verifyClass(MM4, 'Millimeter');
            testCase.verifyEqual(MM3.get(), MM4.get());
            testCase.verifyEqual(MM3.get(), 3737.915729387168, 'AbsTol', 10^-6);
            testCase.verifyEqual(MM4.get(), 3737.915729387168, 'AbsTol', 10^-6);
        end

        function test_distance_without_input_syntax_1(testCase)
            MM3 = distance(testCase.MM1);
            MM4 = distance(testCase.MM2);
            testCase.verifyClass(MM3, 'Millimeter');
            testCase.verifyClass(MM4, 'Millimeter');
            testCase.verifyEqual(MM3.get(), 3741.657386773941, 'AbsTol', 10^-6);
            testCase.verifyEqual(MM4.get(), 3.741657386773941, 'AbsTol', 10^-6);
        end

        function test_distance_with_input_syntax_2(testCase)
            MM3 = testCase.MM1.distance(testCase.MM2);
            MM4 = testCase.MM2.distance(testCase.MM1);
            testCase.verifyClass(MM3, 'Millimeter');
            testCase.verifyClass(MM4, 'Millimeter');
            testCase.verifyEqual(MM3.get(), MM4.get());
            testCase.verifyEqual(MM3.get(), 3737.915729387168, 'AbsTol', 10^-6);
            testCase.verifyEqual(MM4.get(), 3737.915729387168, 'AbsTol', 10^-6);
        end

        function test_distance_without_input_syntax_2(testCase)
            MM3 = testCase.MM1.distance();
            MM4 = testCase.MM2.distance();
            testCase.verifyClass(MM3, 'Millimeter');
            testCase.verifyClass(MM4, 'Millimeter');
            testCase.verifyEqual(MM3.get(), 3741.657386773941, 'AbsTol', 10^-6);
            testCase.verifyEqual(MM4.get(), 3.741657386773941, 'AbsTol', 10^-6);
        end

        function test_meter_conversion(testCase)
            M1 = testCase.MM1.convert_meter();
            M2 = testCase.MM2.convert_meter();
            testCase.verifyClass(M1, 'Meter3D');
            testCase.verifyClass(M2, 'Meter3D');
            testCase.verifyEqual(M1.get(), [1; 2; 3]);
            testCase.verifyEqual(M2.get(), [0.001; 0.002; 0.003]);
        end

        function test_addition_syntax_1(testCase)
            MM3 = add(testCase.MM1, testCase.MM2);
            testCase.verifyClass(MM3, 'Millimeter3D');
            testCase.verifyEqual(testCase.MM1.get(), [1000; 2000; 3000]);
            testCase.verifyEqual(testCase.MM2.get(), [1; 2; 3]);
            testCase.verifyEqual(MM3.get(), [1001; 2002; 3003]);
        end

        function test_addition_syntax_2(testCase)
            MM3 = testCase.MM1.add(testCase.MM2);
            testCase.verifyClass(MM3, 'Millimeter3D');
            testCase.verifyEqual(testCase.MM1.get(), [1000; 2000; 3000]);
            testCase.verifyEqual(testCase.MM2.get(), [1; 2; 3]);
            testCase.verifyEqual(MM3.get(), [1001; 2002; 3003]);
        end

        function test_subtraction_syntax_1(testCase)
            MM3 = subtract(testCase.MM1, testCase.MM2);
            MM4 = subtract(testCase.MM2, testCase.MM1);
            testCase.verifyClass(MM3, 'Millimeter3D');
            testCase.verifyClass(MM4, 'Millimeter3D');
            testCase.verifyEqual(testCase.MM1.get(), [1000; 2000; 3000]);
            testCase.verifyEqual(testCase.MM2.get(), [1; 2; 3]);
            testCase.verifyEqual(MM3.get(), [999; 1998; 2997]);
            testCase.verifyEqual(MM4.get(), [-999; -1998; -2997]);
        end

        function test_subtraction_syntax_2(testCase)
            MM3 = testCase.MM1.subtract(testCase.MM2);
            MM4 = testCase.MM2.subtract(testCase.MM1);
            testCase.verifyClass(MM3, 'Millimeter3D');
            testCase.verifyClass(MM4, 'Millimeter3D');
            testCase.verifyEqual(testCase.MM1.get(), [1000; 2000; 3000]);
            testCase.verifyEqual(testCase.MM2.get(), [1; 2; 3]);
            testCase.verifyEqual(MM3.get(), [999; 1998; 2997]);
            testCase.verifyEqual(MM4.get(), [-999; -1998; -2997]);
        end
    end

end