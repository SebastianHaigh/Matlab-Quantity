classdef Point3 < matlab.unittest.TestCase

    methods (Test)
        function test_object_construction(testCase)
            p = Point3(0, 0, 0);
            testCase.verifyClass(p, 'Point3');
        end

        function test_get_methods(testCase)
            vec = [127, 729, 12];
            p = Point3(vec(1), vec(2), vec(3));
            
            testCase.verifyEqual(p.get(), vec);
            testCase.verifyEqual(p.get_x(), vec(1));
            testCase.verifyEqual(p.get_y(), vec(2));
            testCase.verifyEqual(p.get_z(), vec(3));
        end

        function test_distance_zero(testCase)
            vec1 = [127, 729, 12];
            vec2 = [127, 729, 12];

            p1 = Point3(vec1(1), vec1(2), vec1(3));
            p2 = Point3(vec2(1), vec2(2), vec2(3));

            testCase.verifyEqual(p1.distance(p2), 0);
            testCase.verifyEqual(distance(p1, p2), 0);
        end

        function test_distance_non_zero(testCase)
            vec1 = [127, 729, 12];
            vec2 = [-521, 912, 320];

            p1 = Point3(vec1(1), vec1(2), vec1(3));
            p2 = Point3(vec2(1), vec2(2), vec2(3));

            expected_distance = 0;
            expected_distance = expected_distance + (vec1(1) - vec2(1))^2;
            expected_distance = expected_distance + (vec1(2) - vec2(2))^2;
            expected_distance = expected_distance + (vec1(3) - vec2(3))^2;
            expected_distance = sqrt(expected_distance);

            testCase.verifyEqual(p1.distance(p2), expected_distance);
            testCase.verifyEqual(distance(p1, p2), expected_distance);
        end
    end

end