classdef Point3Test < matlab.unittest.TestCase

    methods (Test)
        function test_object_construction_from_xyz_components(testCase)
            import Quantity.Point3
            p = Point3(0, 0, 0);
            testCase.verifyClass(p, 'Quantity.Point3');
        end

        function test_object_construction_from_column_vector(testCase)
            import Quantity.Point3
            vec = [1; 2; 3];
            p = Point3(vec);
            testCase.verifyClass(p, 'Quantity.Point3');
            testCase.verifyEqual(p.get(), vec);
        end

        function test_object_construction_from_row_vector(testCase)
            import Quantity.Point3
            vec = [1, 2, 3];
            p = Point3(vec);
            testCase.verifyClass(p, 'Quantity.Point3');
            testCase.verifyEqual(p.get(), vec');
        end

        function test_object_construction_from_2_vector(testCase)
            import matlab.unittest.constraints.Throws
            import Quantity.Point3
            vec = [1, 2];
            testCase.verifyThat(@() Point3(vec), Throws('Point3:InvalidInput'));
        end

        function test_object_construction_from_2_components(testCase)
            import matlab.unittest.constraints.Throws
            import Quantity.Point3
            vec = [1, 2];
            testCase.verifyThat(@() Point3(vec(1), vec(2)), Throws('Point3:InvalidInput'));
        end

        function test_get_methods(testCase)
            import Quantity.Point3
            vec = [127; 729; 12];
            p = Point3(vec(1), vec(2), vec(3));
            
            testCase.verifyEqual(p.get(), vec);
            testCase.verifyEqual(p.get_x(), vec(1));
            testCase.verifyEqual(p.get_y(), vec(2));
            testCase.verifyEqual(p.get_z(), vec(3));
        end

        function test_distance_zero(testCase)
            import Quantity.Point3
            vec1 = [127; 729; 12];
            vec2 = [127; 729; 12];

            p1 = Point3(vec1(1), vec1(2), vec1(3));
            p2 = Point3(vec2(1), vec2(2), vec2(3));

            testCase.verifyEqual(p1.distance(p2), 0);
            testCase.verifyEqual(distance(p1, p2), 0);
        end

        function test_distance_non_zero(testCase)
            import Quantity.Point3
            vec1 = [127; 729; 12];
            vec2 = [-521; 912; 320];

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

        function test_distance_from_origin(testCase)
            import Quantity.Point3
            vec = [127; 729; 12];

            p1 = Point3(vec(1), vec(2), vec(3));

            expected_distance = sqrt(vec(1)^2 + vec(2)^2 + vec(3)^2);

            testCase.verifyEqual(p1.distance(), expected_distance);
            testCase.verifyEqual(distance(p1), expected_distance);
        end

        function test_add(testCase)
            import Quantity.Point3
            vec1 = [127; 729; 12];
            vec2 = [12; 729; 127];

            p1 = Point3(vec1(1), vec1(2), vec1(3));
            p2 = Point3(vec2(1), vec2(2), vec2(3));

            p3 = p1.add(p2);
            p4 = p2.add(p1);
            p5 = add(p1, p2);
            p6 = add(p2, p1);

            testCase.verifyEqual(p3.get(), vec1 + vec2);
            testCase.verifyEqual(p4.get(), vec1 + vec2);
            testCase.verifyEqual(p5.get(), vec1 + vec2);
            testCase.verifyEqual(p6.get(), vec1 + vec2);
        end

        function test_sub(testCase)
            import Quantity.Point3
            vec1 = [127; 729; 12];
            vec2 = [12; 729; 127];

            p1 = Point3(vec1(1), vec1(2), vec1(3));
            p2 = Point3(vec2(1), vec2(2), vec2(3));

            p3 = p1.sub(p2);
            p4 = sub(p1, p2);
            p5 = p2.sub(p1);
            p6 = sub(p2, p1);

            testCase.verifyEqual(p3.get(), vec1 - vec2);
            testCase.verifyEqual(p4.get(), vec1 - vec2);
            testCase.verifyEqual(p5.get(), vec2 - vec1);
            testCase.verifyEqual(p6.get(), vec2 - vec1);
        end
    end

end