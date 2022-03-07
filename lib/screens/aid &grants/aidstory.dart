import 'package:bangkit/constants/themeconstants.dart';
import 'package:bangkit/controllers/post_controller.dart';
import 'package:bangkit/models/aid_and_grant.dart';
import 'package:bangkit/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:photo_view/photo_view_gallery.dart';

class Story extends StatefulWidget {
  const Story({Key? key, required this.post}) : super(key: key);
  final Post post;
  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  bool isUseful = false;
  // var _rating = 0.0;

  @override
  void initState() {
    super.initState();
    controller = Get.put(PostController(widget.post));
  }

  late PostController controller;

  Widget getAttachmentTile(url) {
    return GestureDetector(
      onTap: () async {
        await launch(url);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey,
          ),
          child: const AspectRatio(
            aspectRatio: 1,
            child: Icon(
              Icons.attach_file,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }

  Widget getImageTile(url) {
    return GestureDetector(
      onTap: () async {
        showDialog(
            context: context,
            builder: (context) {
              return PhotoView(imageProvider: NetworkImage(url));
            });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey,
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(url, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }

  void _launchMailURL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: widget.post.email,
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchPhoneURL() async {
    final uri = Uri(
      scheme: 'tel',
      path: widget.post.phone,
    );
    var url = uri.toString();
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchMapURL() async {
    final url =
        Uri.encodeFull("http://maps.apple.com/?q=${widget.post.address}");
    if (await canLaunch(url)) {
      await launch(
        url,
        enableJavaScript: false,
        enableDomStorage: false,
        universalLinksOnly: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  // void _launchMapURL() async {
  //   await launch("https://maps.apple.com/?q=${widget.post.address}");
  // }

  Widget listOfDetails(title, icon, void Function()? onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF00b3df),
      ),
      title: Text(
        title,
        style: getText(context).subtitle2,
      ),
      onTap: onTap,
    );
  }

  List<String> get attachments => widget.post.attachments ?? [];
  List<String> get videos => widget.post.videos ?? [];
  List<String> get media => widget.post.media ?? [];

  @override
  Widget build(BuildContext context) {
    return // Generated code for this Column Widget...
        SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: SizedBox(
              height: getHeight(context) * 0.15,
              child: Image.asset('assets/bina.png')),
        ),
        body: GetBuilder(
            init: controller,
            builder: (_) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24, 20, 24, 0),
                            child: Text(
                              widget.post.title,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              maxLines: 3,
                              softWrap: true,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF090F13),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24, 4, 24, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 24),
                                    child: Text(
                                      widget.post.description,
                                      style: const TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF8B97A2),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          media.isEmpty
                              ? Container()
                              : MediaLister(
                                  type: FileType.image,
                                  urls: widget.post.media ?? []),
                          videos.isEmpty
                              ? Container()
                              : MediaLister(
                                  type: FileType.video,
                                  urls: widget.post.videos ?? []),
                          attachments.isEmpty
                              ? Container()
                              : MediaLister(
                                  type: FileType.attachment,
                                  urls: widget.post.attachments ?? []),
                          const SizedBox(
                            height: 20,
                          ),
                          listOfDetails(widget.post.address, Icons.location_pin,
                              _launchMapURL),
                          listOfDetails(widget.post.name, Icons.person, null),
                          listOfDetails(
                              widget.post.phone, Icons.phone, _launchPhoneURL),
                          listOfDetails(
                              widget.post.email, Icons.mail, _launchMailURL),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: widget.post.canRate
                                ? const Text("Please rate below")
                                : const Text("Thanks for your rating"),
                          ),
                          RatingBar.builder(
                            // ignoreGestures: !widget.post.canRate,
                            initialRating: controller.myRating,
                            allowHalfRating: false,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (double value) {
                              // print(value);

                              setState(() {
                                controller.myRating = value;
                              });
                            },
                          ),
                          ElevatedButton(
                              onPressed: () {
                                showFutureDialog(
                                    context: context,
                                    future: widget.post
                                        .ratePost(controller.myRating.toInt()));
                              },
                              child: const Text("Submit Rating")),
                          SizedBox(
                            height: getHeight(context) * 0.1,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class MediaLister extends StatelessWidget {
  const MediaLister({Key? key, required this.type, required this.urls})
      : super(key: key);

  final FileType type;
  final List<String> urls;

  static const _array = ["Images", "Videos", "Attachments"];

  showMultiplePhotoView() {
    return MultiplePhotoView(urls: urls);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Text(
            _array[type.index],
            style: Theme.of(context).textTheme.headline6!.merge(const TextStyle(
                  shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFF22A8E0),
                  decorationThickness: 3,
                  decorationStyle: TextDecorationStyle.solid,
                )),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: urls.isEmpty
                ? const [Text("No files found")]
                : urls.map((e) => getTile(e, context)).toList(),
          ),
        ),
        const Divider(),
      ],
    );
  }

  Widget getTile(urls, context) {
    switch (type) {
      case FileType.image:
        return getImageTile(urls, context);
      case FileType.video:
        return getVideoTile(urls, context);
      case FileType.attachment:
        return getAttachmentTile(urls, context);
    }
  }

  Widget getImageTile(url, context) {
    var index = urls.indexWhere((element) => element == url);
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Material(
                child: Stack(children: [
                  MultiplePhotoView(urls: urls, initalPage: index),
                  Positioned(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 32, horizontal: 16),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )),
                  )
                ]),
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey,
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(url, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }

  Widget getVideoTile(urls, context) {
    var id;

    if (urls.toString().contains("=")) {
      id = urls.toString().split("=").last;
    } else {
      id = urls.toString().split("/").last;
    }

    var url = "https://img.youtube.com/vi/$id/0.jpg";
    return GestureDetector(
      onTap: () {
        Get.to(() => YouTube(id: id));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey,
            image: DecorationImage(
                image: NetworkImage(url), fit: BoxFit.contain, scale: 0.5),
          ),
          child: Icon(
            Icons.play_arrow,
            size: 30,
            color: Colors.grey.shade200,
          ),
        ),
      ),
    );
  }

  Widget getAttachmentTile(url, [context]) {
    return GestureDetector(
      onTap: () async {
        await launch(url);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey,
          ),
          child: const AspectRatio(
            aspectRatio: 1,
            child: Icon(
              Icons.attach_file,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}

class YouTube extends StatefulWidget {
  const YouTube({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<YouTube> createState() => _YouTubeState();
}

class _YouTubeState extends State<YouTube> {
  bool mute = true;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: mute,
      ),
    );
  }

  Widget getMuteIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          mute = !mute;
        });
        if (mute) {
          _controller.mute();
        } else {
          _controller.unMute();
        }
      },
      child: mute ? const Icon(Icons.volume_off) : const Icon(Icons.volume_up),
    );
  }

  late YoutubePlayerController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          width: getWidth(context),
          bottomActions: [
            CurrentPosition(),
            ProgressBar(isExpanded: true),
            getMuteIcon(),
          ],
        ),
      ),
    );
  }
}

class MultiplePhotoView extends StatefulWidget {
  MultiplePhotoView({Key? key, required this.urls, this.initalPage})
      : super(key: key);

  final List<String> urls;
  final int? initalPage;

  @override
  State<MultiplePhotoView> createState() => _MultiplePhotoViewState();
}

class _MultiplePhotoViewState extends State<MultiplePhotoView> {
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.initalPage ?? 0);
  }

  late PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoViewGallery.builder(
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(widget.urls[index]),
          initialScale: PhotoViewComputedScale.contained * 0.8,
          // heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
        );
      },
      itemCount: widget.urls.length,
      loadingBuilder: (context, event) => Center(
        child: Container(
          color: Colors.white,
          width: 20.0,
          height: 20.0,
          child: CircularProgressIndicator(
            value: event == null
                ? 0
                : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
          ),
        ),
      ),
      // backgroundDecoration: widget.backgroundDecoration,
      pageController: pageController,
      onPageChanged: (page) {
        // pageController.jumpToPage(page);
      },
    ));
  }
}

enum FileType { image, video, attachment }
