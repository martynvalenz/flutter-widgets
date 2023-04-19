import 'package:flutter/material.dart';

class UIControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';
  const UIControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls + Tiles'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, bike, walk, bus, train}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = false;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreafkast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloper, 
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          }, 
        ),
        // const Divider(),
        ExpansionTile(
          title: const Text('Transportation'),
          subtitle:  Text('Viajar por $selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('Car'),
              subtitle: const Text('Viajar por ranfla'),
              value: Transportation.car, 
              groupValue: selectedTransportation, 
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.car;
                });
              }, 
            ),
            RadioListTile(
              title: const Text('Bike'),
              subtitle: const Text('Viajar por wila'),
              value: Transportation.bike, 
              groupValue: selectedTransportation, 
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.bike;
                });
              }, 
            ),
            RadioListTile(
              title: const Text('Walk'),
              subtitle: const Text('Viajar por pie'),
              value: Transportation.walk, 
              groupValue: selectedTransportation, 
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.walk;
                });
              }, 
            ),
            RadioListTile(
              title: const Text('Bus'),
              subtitle:  const Text('Viajar por bus'),
              value: Transportation.bus, 
              groupValue: selectedTransportation, 
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.bus;
                });
              }, 
            ),
            RadioListTile(
              title: const Text('Train'),
              subtitle: const Text('Viajar por tren'),
              value: Transportation.train, 
              groupValue: selectedTransportation, 
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.train;
                });
              }, 
            ),
          ],
        ),
        CheckboxListTile(
          value: wantsBreafkast, 
          title: const Text('Quiere desayuno?'),
          subtitle: const Text('Que rico'),
          onChanged: (value) {
            setState(() {
              wantsBreafkast = !wantsBreafkast;
            });
          }, 
        ),
        CheckboxListTile(
          value: wantsLunch, 
          title: const Text('Quiere almuerzo?'),
          subtitle: const Text('Que rico'),
          onChanged: (value) {
            setState(() {
              wantsLunch = !wantsLunch;
            });
          }, 
        ),
        CheckboxListTile(
          value: wantsDinner, 
          title: const Text('Quiere cena?'),
          subtitle: const Text('Que rico'),
          onChanged: (value) {
            setState(() {
              wantsDinner = !wantsDinner;
            });
          }, 
        ),
      ],
    );
  }
}