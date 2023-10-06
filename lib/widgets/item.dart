import 'package:flutter/material.dart';
import 'package:shic/data/items.dart';
import 'package:shic/models/item.dart' as item_model;
import 'package:shic/widgets/item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class Item extends StatelessWidget {
  Item({super.key, required this.item, required this.onSelectItem});

  void Function(item_model.Item) onSelectItem;

  final item_model.Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Theme.of(context).textTheme.bodyLarge!.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: () {
          onSelectItem(item);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              item.imageUrl != null
                  ? FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: item.imageUrl!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  : const SizedBox(height: 100, width: double.infinity),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    color: Colors.black54,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 5),
                            child: Text(
                              item.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ),
                          const SizedBox(height: 2),
                          ItemTrait(
                            icon: Icons.add_comment_outlined,
                            label: item.description,
                          ),
                          const SizedBox(height: 2),
                          ItemTrait(
                            icon: Icons.timelapse,
                            label: formatter.format(item.startDate),
                          ),
                          const SizedBox(height: 2),
                          ItemTrait(
                            icon: Icons.local_activity,
                            label: item.active ? 'active' : 'inactive',
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
