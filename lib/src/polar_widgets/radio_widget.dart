import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'themes.dart';

class RadioGroupOptionInfo extends Equatable {
  final String value;
  final String label;
  final bool isDisabled;

  const RadioGroupOptionInfo({
    required this.value,
    required this.label,
    this.isDisabled = false,
  });

  @override
  List<Object?> get props => [value, label];
}

class RadioGroupInputWidget extends StatelessWidget {
  final List<RadioGroupOptionInfo> optionsList;
  final RadioGroupOptionInfo? selectedOption;
  final void Function(RadioGroupOptionInfo value) onChanged;
  final bool isSegmented;
  final bool isRequired;
  final bool isHorizontal;
  final String? tooltipMessage;
  final String label;

  const RadioGroupInputWidget({
    super.key,
    required this.optionsList,
    required this.selectedOption,
    required this.onChanged,
    this.isSegmented = false,
    this.isRequired = false,
    this.isHorizontal = true,
    this.tooltipMessage,
    required this.label,
  });

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
              final widgetList = optionsList
                  .map((entry) => _SegmentedRadioTileWidget(
                        label: entry.label,
                        isHorizontal: isHorizontal,
                        isSelected: entry == selectedOption,
                        onTap: () => onChanged(entry),
                        isDisabled: entry.isDisabled,
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
              final widgetList = optionsList
                  .map(
                    (entry) => _NormalRadioTileWidget(
                      label: entry.label,
                      isHorizontal: isHorizontal,
                      isSelected: entry == selectedOption,
                      onTap: () => onChanged(entry),
                      isDisabled: entry.isDisabled,
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
    required this.isDisabled,
  });

  final bool isHorizontal;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
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
                color: isSelected
                    ? (isDisabled
                        ? const Color(0xFFF2F2F2)
                        : context.themeX.appColors.primary)
                    : Colors.white,
                borderRadius: BorderRadius.circular(40),
                border: isSelected
                    ? null
                    : Border.all(
                        color: isDisabled
                            ? const Color(0xFFDCDCDC)
                            : const Color(0xFF949494),
                        width: 1,
                      ),
              ),
              margin: const EdgeInsets.only(right: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: isDisabled && isSelected
                      ? Colors.black.withOpacity(0.3)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: isDisabled
                    ? const Color(0xFFDCDCDC)
                    : const Color(0xFF353535),
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
    required this.isDisabled,
  });

  final bool isHorizontal;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDisabled
                  ? const Color(0xFFF2F2F2)
                  : context.themeX.appColors.primary)
              : Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isDisabled
                ? const Color(0xFFDCDCDC)
                : (isSelected ? Colors.white : const Color(0xFF353535)),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
