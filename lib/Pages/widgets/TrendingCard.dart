import 'package:flutter/material.dart';

class Trendingcard extends StatefulWidget {
  final String imageUrl;
  final String tag;
  final String time;
  final String title;
  final String author;
  final VoidCallback ontap;
  const Trendingcard(
      {super.key,
      required this.imageUrl,
      required this.tag,
      required this.time,
      required this.title,
      required this.author,
      required this.ontap});

  @override
  State<Trendingcard> createState() => _TrendingcardState();
}

class _TrendingcardState extends State<Trendingcard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: widget.ontap,
          child: Container(
            margin: const EdgeInsets.only(bottom: 5.0),
            padding: const EdgeInsets.all(8.0),
            // height: 300,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      widget.imageUrl ,
                      fit: BoxFit.cover,
                      
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.tag,
                        style: Theme.of(context).textTheme.titleMedium),
                    Text(widget.time,
                        style: Theme.of(context).textTheme.labelSmall)
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        widget.title,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 10.0,
                      child: Text(
                        widget.author[0],
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Flexible(
                        child: Text(
                      widget.author,
                      maxLines: 2,
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 15.0)
      ],
    );
  }
}
