classdef (Abstract) Length < matlab.mixin.Heterogenous

    methods (Abstract)
        add()
        sub()
        mul()
        div()
        get()
    end
end