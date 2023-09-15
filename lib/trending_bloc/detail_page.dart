// bloc is not used in this page as this page is just a read only page  and no any event occurs so  no bloc is not necessary

import 'package:avacado_test/model/trending_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  SimpleModel? data;
  DetailsPage({super.key, this.data});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late YoutubePlayerController _controller;
  final videoUrl = "https://www.youtube.com/watch?v=cYPKqRIFVdU";
  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor: Colors.green,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text(
              'Post',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white),
            ),
            actions: const [
              Icon(
                Icons.favorite,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.share,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 3,
              //   child: Image.network(
              //     "https://img.youtube.com/vi/6cwnBBAVIwE/0.jpg",
              //     fit: BoxFit.cover,
              //     width: double.infinity,
              //     // height: 2.0,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero, // Set this
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.red // and this
                          ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 0.0, horizontal: 8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 18,
                            ),
                            Text(
                              'Youtube',
                              style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      widget.data!.timestamp.toString(),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  widget.data!.title!.toUpperCase(),
                  // maxLines: 3,

                  style: const TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                widget.data!.body!,
                // style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
