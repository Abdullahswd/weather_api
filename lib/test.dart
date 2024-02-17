import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gauge App'),
        ),
        body: Center(
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 91,
                showLabels: true,
                showTicks: true,

                axisLineStyle: AxisLineStyle(
                  color: Colors.deepPurple,

                  thickness: 0.2,
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  NeedlePointer(
                    enableAnimation: true,
                    animationDuration: 1200,
                    needleColor: Colors.deepPurple,
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [Colors.redAccent, Colors.deepPurple]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}