# Matlab-Quantity

Version: 1.0.1-alpha

[![Run MATLAB Tests on GitHub-Hosted Runner](https://github.com/SebastianHaigh/Matlab-Quantity/actions/workflows/quantity.yml/badge.svg)](https://github.com/SebastianHaigh/Matlab-Quantity/actions/workflows/quantity.yml)

Matlab-Quantity is a protoype toolbox for managing unit conversions.

## Millimeter & Meter

---

Convert between meters and millimeters:

```matlab
mm = Millimeter(1000) % creates a millimeter object
mm.get() % Returns the value of the object.

>>> ans 1000

m = mm.convert_meter() % returns Meter object
m.get() % Returns the value of the object.

>>> ans 1
```

## Meter3D and Millimeter3D.

---

```matlab
mm = Millimeter3D(1000, 1000, 1000) % creates a Millimeter3D object
mm.get() % Returns the value of the object.

>>> ans [1000; 1000; 1000]

mm.get_x() % Returns the value of the x coordinate

>>> ans 1000

m = mm.convert_meter() % returns Meter3D object
m.get() % Returns the value of the object.

>>> ans [1; 1; 1]

m.get_x()

>>> ans 1
```

## Seconds, Milliseconds & Sampled Time

---

```matlab
s = Second(2);
ms = Millisecond(1500);
samp = Sample(2000, s); % where s is the sample period in seconds specified using a Second object
```

## Frequency in Hertz & Samples/Second

---

Define frequency in Hertz and sample rates in samples per second.

## Meters/Second

---

Speed is currently offered only in meters per second, but this supports conversion to distance and time we combined with the approprate Quantity objects. For example,set up the following `MetersPerSecond` and `Second`objects.

```matlab
speed = MetersPerSecond(2);
seconds = Second(2);
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
