classdef (Abstract) Length3 < matlab.mixin.Heterogenous

    methods (Abstract)
        add()
        sub()
        distance()
        get()
        get_x()
        get_y()
        get_z()
    end
end