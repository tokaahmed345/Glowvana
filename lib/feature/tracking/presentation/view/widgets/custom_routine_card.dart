
import 'package:flutter/material.dart';

class CustomRoutineCard extends StatelessWidget {
  const CustomRoutineCard({
    super.key,
    required this.label,
    required this.isChecked,
    required this.icon,
    required this.onChanged,
  });

  final String label;
  final bool isChecked;
  final IconData ?icon;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
onChanged?.call(!isChecked);
      },
      child: Card(

    margin: const EdgeInsets.only(bottom: 16),
        
        child: Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: onChanged,
              activeColor:Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  
                  label,
                  style:Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 27)
                ,              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
