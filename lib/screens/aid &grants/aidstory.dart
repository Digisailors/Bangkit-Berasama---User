import 'package:bangkit/constants/themeconstants.dart';
import 'package:bangkit/models/aid_and_grant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class Story extends StatefulWidget {
  const Story({Key? key, required this.post}) : super(key: key);
  final Post post;
  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  bool isUseful = false;

  Widget getImage(BuildContext context, String url, width, height) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              // color: Color(0xFFDBE2E7),
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return PhotoView(imageProvider: NetworkImage(url));
                        });
                  },
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Image.network(url),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0x3A000000),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0x3A000000),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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

  Widget listOfDetails(title, icon) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListTile(
            leading: Icon(
              icon,
              color: Color(0xFF00b3df),
            ),
            title: Text(
              title,
              style: getText(context).subtitle2,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return // Generated code for this Column Widget...
        SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: SizedBox(height: getHeight(context) * 0.15, child: Image.asset('assets/bina.png')),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(24, 20, 24, 0),
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
                      padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Images & Videos',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: getHeight(context) * 0.004,
                          width: getWidth(context) * 0.4,
                          color: const Color(0xFF22A8E0),
                        ),
                      ),
                    ),
                    const Divider(),
                    SizedBox(
                        height: getHeight(context) * 0.20,
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: widget.post.media == null
                                ? [Container()]
                                // : widget.post.media!.map((e) => getImage(context, e, getHeight(context) * 0.10, getHeight(context) * 0.10)).toList(),
                                : widget.post.media!.map((e) => getImageTile(e)).toList())),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Attachment',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: getHeight(context) * 0.004,
                          width: getWidth(context) * 0.4,
                          color: const Color(0xFF22A8E0),
                        ),
                      ),
                    ),
                    const Divider(),
                    SizedBox(
                        height: getHeight(context) * 0.20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: widget.post.attachments!.map((e) => getAttachmentTile(e)).toList(),
                        )),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    listOfDetails(widget.post.address, Icons.location_pin),
                    listOfDetails(widget.post.name, Icons.person),
                    listOfDetails(widget.post.phone, Icons.phone),
                    listOfDetails(widget.post.email, Icons.mail),
                    const Divider(),
                    RatingBar.builder(
                      ignoreGestures: !widget.post.canRate,
                      initialRating: widget.post.myRating.toDouble(),
                      allowHalfRating: false,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (double value) {
                        print(value);
                        widget.post.ratePost(value.toInt());
                      },
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
