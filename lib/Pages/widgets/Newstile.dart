import 'package:flutter/material.dart';

class Newstile extends StatefulWidget {
  final String imageUrl;
  final String time;
  final String title;
  final String author;
  final VoidCallback ontap;
  const Newstile(
      {super.key,
      required this.imageUrl,
      required this.time,
      required this.title,
      required this.author,
      required this.ontap});

  @override
  State<Newstile> createState() => _NewstileState();
}

class _NewstileState extends State<Newstile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.ontap,
          child: Container(
            height: 150.0,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                      )),
                ),
                
                const SizedBox(height: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              maxLines: 2,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Text(widget.title,
                          style: const TextStyle(fontSize: 15.0), maxLines: 2),
                      const SizedBox(height: 10.0),
                      Text(widget.time,
                          style: Theme.of(context).textTheme.labelSmall),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
