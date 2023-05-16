import 'package:flutter/material.dart';
import 'package:mobile/models/post.dart';
import 'package:mobile/payload/response/post_reponse.dart';
import 'package:mobile/utils/DurationUtil.dart';
import 'package:mobile/constant.dart';

class ListPost extends StatefulWidget {
  final List<PostReponse> posts;

  ListPost({required this.posts});

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<ListPost> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      itemCount: widget.posts.length,
      itemBuilder: (BuildContext context, int index) {
        final post = widget.posts[index];
        return Card(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  radius: 20, // kích thước bán kính của ảnh tròn
                  backgroundImage: NetworkImage(post.avatarUser),
                ),
                title: Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    post.nameUser,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.public, size: 16),
                    SizedBox(width: 2),
                    Text(DurationUtil.timeAgoSinceDate(post.date).toString()),
                  ],
                ),
              ),
              SizedBox(
                  width: 400,
                  child: Image.network(
                    // postImg + post.image,
                    hostImg + post.image,
                    fit: BoxFit.cover,
                  )),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.fromLTRB(21.0, 0, 21.0, 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.text,
                      maxLines: isExpanded ? null : 2,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            isExpanded ? 'Thu gọn' : 'Xem thêm',
                            textAlign: TextAlign.justify,
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Icon(
                            isExpanded ? Icons.expand_less : Icons.expand_more,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
