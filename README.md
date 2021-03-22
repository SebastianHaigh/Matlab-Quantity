# Matlab-Quantity

Version: 1.0.0-alpha

[![Run MATLAB Tests on GitHub-Hosted Runner](https://github.com/SebastianHaigh/Matlab-Quantity/actions/workflows/quantity.yml/badge.svg)](https://github.com/SebastianHaigh/Matlab-Quantity/actions/workflows/quantity.yml)

Matlab-Quantity is a prototype toolbox for managing unit conversions.

## Point3

---

Point3 is a base class for storing 3D points. This is useful for modelling positions.

## Millimeter3 & Meter3

Millimeter3 and Meter3 are built around the functionality of the Point3 class. They offers all the same methods as a Point3 except they also tracks the unit of the point coordinates and allows conversions to other units.

## Length Package

---

The Length package currently offers the ability to convert between meters and millimeters:

```matlab
mm = Length.Millimeter(1000) % creates a millimeter object
mm.get() % Returns the value of the object.

>>> ans 1000

m = mm.convert_meter() % returns Length.Meter object
m.get() % Returns the value of the object.

>>> ans 1
```

The length package also offers a 3D point in meters and millimeters.

```matlab
mm = Length.Millimeter3D(1000, 1000, 1000) % creates a Millimeter3D object
mm.get() % Returns the value of the object.

>>> ans [1000; 1000; 1000]

mm.get_x() % Returns the value of the x coordinate

>>> ans 1000

m = mm.convert_meter() % returns Length.Meter3D object
m.get() % Returns the value of the object.

>>> ans [1; 1; 1]

m.get_x()

>>> ans 1
```

## Time Package

---

The Time package offers classes for holding seconds and milliseconds. The Time package also contains a class for holding sampled time.

```matlab
s = Time.Second(2);
ms = Time.Millisecond(1500);
samp = Time.Sample(2000, s); % where s is the sample period in seconds specified using a Time.Second object
```

## Frequency Package

---

Define frequency in Hertz and sample rates in samples per second.

## Speed Package

---

Speed is currently offered only in meters per second, but this supports conversion to distance and time we combined with the approprate Quantity objects. For example,set up the following `MetersPerSecond` and `Second`objects.

```matlab
speed = Speed.MetersPerSecond(2);
seconds = Time.Second(2);
```

The distance travelled in 2 seconds by an object with a speed of 2 m/s can be found by calling:

```matlab
meter = Speed.convert_meter(seconds);
meter.get()

ans = 4
```

Similarly, the time taken for the object with speed of 2 m/s to travel 4 meters can be found by calling:

```matlab
time_taken = Speed.convert_second(meter);
time_taken.get()

ans = 2
```
