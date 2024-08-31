import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductQuanity extends HookConsumerWidget {
  const ProductQuanity({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productSize = useState(14);
    final color = Theme.of(context).primaryColor;
    void increaseProductSize() {
      productSize.value++;
    }

    void decreaseProductSize() {
      productSize.value--;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.filled(
          style: IconButton.styleFrom(backgroundColor: color.withOpacity(.2)),
          onPressed: () {
            decreaseProductSize();
          },
          icon: const Icon(
            Icons.remove,
            color: Colors.white,
          ),
        ),
        const Gap(10),
        Text(
          "${productSize.value} kg",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: const Color(0xFFFFFFFF).withOpacity(.75),
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
        const Gap(10),
        IconButton.filled(
          style: IconButton.styleFrom(backgroundColor: color),
          onPressed: () {
            increaseProductSize();
          },
          icon: const Icon(Icons.add, color: Colors.white),
        ),
      ],
    );
  }
}
