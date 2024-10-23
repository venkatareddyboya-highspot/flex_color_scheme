import 'package:flutter/material.dart';

class RadioGroupInputWidget extends StatelessWidget {
  final Map<String, String> options;
  final String? selectedOption;
  final Function(String val) onChanged;
  final bool isSegmented;
  final bool isRequired;
  final bool isHorizontal;
  final String? tooltipMessage;
  final String label;

  const RadioGroupInputWidget({
    Key? key,
    required this.options,
    required this.selectedOption,
    required this.onChanged,
    this.isSegmented = false,
    this.isRequired = false,
    this.isHorizontal = true,
    this.tooltipMessage,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LabelWidget(
          label: label,
          isRequired: isRequired,
          tooltipMessage: tooltipMessage,
        ),
        const SizedBox(height: 8),
        if (isSegmented) ...[
          Builder(
            builder: (_) {
              final widgetList = options.entries
                  .map((entry) => _SegmentedRadioTileWidget(
                        label: entry.value,
                        isHorizontal: isHorizontal,
                        isSelected: entry.key == selectedOption,
                        onTap: () => onChanged(entry.key),
                      ))
                  .toList();

              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.all(3),
                child: isHorizontal
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: widgetList,
                      )
                    : Column(children: widgetList),
              );
            },
          ),
        ] else ...[
          Builder(
            builder: (_) {
              final widgetList = options.entries
                  .map(
                    (entry) => _NormalRadioTileWidget(
                      label: entry.value,
                      isHorizontal: isHorizontal,
                      isSelected: entry.key == selectedOption,
                      onTap: () => onChanged(entry.key),
                    ),
                  )
                  .toList();
              return isHorizontal
                  ? Row(children: widgetList)
                  : Column(children: widgetList);
            },
          ),
        ],
      ],
    );
  }
}

class _LabelWidget extends StatelessWidget {
  const _LabelWidget({
    super.key,
    required this.label,
    required this.isRequired,
    this.tooltipMessage,
  });

  final String label;
  final String? tooltipMessage;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        if (isRequired)
          const Text(
            ' *',
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        if (tooltipMessage != null) ...[
          Tooltip(
            message: tooltipMessage!,
            child: const Icon(Icons.info_outline, size: 16, color: Colors.blue),
          ),
        ],
      ],
    );
  }
}

class _NormalRadioTileWidget extends StatelessWidget {
  const _NormalRadioTileWidget({
    super.key,
    required this.isHorizontal,
    required this.label,
    required this.onTap,
    required this.isSelected,
  });

  final bool isHorizontal;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
            right: isHorizontal ? 8 : 0, bottom: isHorizontal ? 0 : 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 20,
              height: 20,
              padding: const EdgeInsets.all(5.5),
              decoration: BoxDecoration(
                  color: isSelected ? Colors.teal : Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  border: isSelected ? null : Border.all(color: Colors.grey)),
              margin: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SegmentedRadioTileWidget extends StatelessWidget {
  const _SegmentedRadioTileWidget({
    super.key,
    required this.isHorizontal,
    required this.label,
    required this.onTap,
    required this.isSelected,
  });

  final bool isHorizontal;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal : Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
