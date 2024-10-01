import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TemperatureIconBar extends StatefulWidget {
  final ValueChanged<String> onTemperatureChanged;

   const TemperatureIconBar({
    super.key,
    required this.onTemperatureChanged,
  });

  @override
  State<TemperatureIconBar> createState() => _TemperatureIconBarState();
}

class _TemperatureIconBarState extends State<TemperatureIconBar> {
  bool selected_1 = false;

  bool selected_2 = true;

  bool selected_3 = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, value, child) =>Padding(
      padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 42),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              ThermoIcon(
                icon: Icons.local_fire_department,
                color: Colors.deepOrange,
                selected: selected_1,
                onTap: () =>
                    setState(() {
                  widget.onTemperatureChanged("Temperature");
                  selected_1 = true;
                  selected_2 = false;
                  selected_3 = false;
                }),
              ),
              selected_1 ? const SizedBox() : const Text("Temperature", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            ],
          ),
          Column(
            children: [
              ThermoIcon(
                icon: Icons.water_drop,
                color: Colors.amber,
                selected: selected_2,
                onTap: () => setState(() {
                  widget.onTemperatureChanged("Moisture Level");
                  selected_1 = false;
                  selected_2 = true;
                  selected_3 = false;
                }),
              ),
              selected_2 ? const SizedBox() : const Text("Moisture Level", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            ],
          ),
          Column(
            children: [
              ThermoIcon(
                icon: Icons.ac_unit_outlined,
                color: Colors.cyan,
                selected: selected_3,
                onTap: () => setState(() {
                  widget.onTemperatureChanged("Humidity");
                  selected_3 = true;
                  selected_2 = false;
                  selected_1 = false;
                }),
              ),
              selected_3 ? const SizedBox() : const Text("Humidity", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    )
    );
  }
}


class ThermoIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  const ThermoIcon({
    required this.icon,
    required this.color,
    required this.onTap,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final selectedButtonSize = size.height < 600 ? 42.0 : 64.0;
    final buttonSize = size.height < 600 ? 32.0 : 48.0;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: selectedButtonSize,
        height: selectedButtonSize,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: selected ? selectedButtonSize : buttonSize,
            height: selected ? selectedButtonSize : buttonSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected ? color.withOpacity(.3) : Colors.grey.shade200,
            ),
            child: Center(
              child: Icon(
                icon,
                size: selected ? selectedButtonSize-12 : buttonSize-12,
                color: selected ? color : Colors.grey.shade300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}