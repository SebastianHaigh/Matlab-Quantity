classdef Millimeter3Test < matlab.unittest.TestCase

    methods (Test)
        function test_object_construction_with_point(testCase)
            import Quantity.Millimeter3
            import Quantity.Point3
            p = Point3(0, 0, 0);
            mm = Millimeter3(p);
            testCase.verifyClass(mm, 'Quantity.Millimeter3');
        end

        function test_object_construction_with_double(testCase)
            import Quantity.Millimeter3
            mm = Millimeter3(0, 0, 0);
            testCase.verifyClass(mm, 'Quantity.Millimeter3');
        end

        function test_get_methods(testCase)
            import Quantity.Millimeter3
            vec = [127; 729; 12];
            mm = Millimeter3(vec(1), vec(2), vec(3));
            
            testCase.verifyEqual(mm.get(), vec);
            testCase.verifyEqual(mm.get_x(), vec(1));
            testCase.verifyEqual(mm.get_y(), vec(2));
            testCase.verifyEqual(mm.get_z(), vec(3));
        end

        function test_distance_zero(testCase)
            import Quantity.Millimeter3
            import Quantity.Point3
            vec1 = [127; 729; 12];
            vec2 = [127; 729; 12];

            mm1 = Millimeter3(Point3(vec1(1), vec1(2), vec1(3)));
            mm2 = Millimeter3(vec2(1), vec2(2), vec2(3));

            testCase.verifyEqual(mm1.distance(mm2), 0);
            testCase.verifyEqual(distance(mm1, mm2), 0);
        end

        function test_distance_non_zero(testCase)
            import Quantity.Millimeter3
            import Quantity.Point3
            vec1 = [127; 729; 12];
            vec2 = [-521; 912; 320];

            mm1 = Millimeter3(Point3(vec1(1), vec1(2), vec1(3)));
            mm2 = Millimeter3(vec2(1), vec2(2), vec2(3));

            expected_distance = 0;
            expected_distance = expected_distance + (vec1(1) - vec2(1))^2;
            expected_distance = expected_distance + (vec1(2) - vec2(2))^2;
            expected_distance = expected_distance + (vec1(3) - vec2(3))^2;
            expected_distance = sqrt(expected_distance);

            testCase.verifyEqual(mm1.distance(mm2), expected_distance);
            testCase.verifyEqual(distance(mm1, mm2), expected_distance);
        end

        function test_distance_from_origin(testCase)
            import Quantity.Millimeter3
            vec = [127; 729; 12];

            mm1 = Millimeter3(vec(1), vec(2), vec(3));

            expected_distance = sqrt(vec(1)^2 + vec(2)^2 + vec(3)^2);

            testCase.verifyEqual(mm1.distance(), expected_distance);
            testCase.verifyEqual(distance(mm1), expected_distance);
        end
    end

end