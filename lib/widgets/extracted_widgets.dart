import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:explore_pixabay/controllers/main_get_controller.dart';
import 'small_widgets.dart';

class ImageCard extends StatelessWidget {
  String imageURL;
  String likesCount;
  String viewsCount;
  String fullScreenImageUrl;

  ImageCard(
      {required this.imageURL,
      required this.likesCount,
      required this.viewsCount,
      required this.fullScreenImageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ImageOpener(fullScreenImageUrl: fullScreenImageUrl);
          },
        );
      },
      child: Container(
        color: Color(0xFFE9DFCB),
        padding: EdgeInsets.all(10),
        child: MainImageWidget(
          imageURL: imageURL,
          likesCount: likesCount,
          viewsCount: viewsCount,
        ),
      ),
    );
  }
}

class MainImageWidget extends StatelessWidget {
  const MainImageWidget({
    Key? key,
    required this.imageURL,
    required this.likesCount,
    required this.viewsCount,
  }) : super(key: key);

  final String imageURL;
  final String likesCount;
  final String viewsCount;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageURL),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            color: Colors.white.withOpacity(0.7),
            child: LikeViewList(
              likeCount: likesCount,
              viewCount: viewsCount,
            ),
          ),
        ],
      ),
    );
  }
}

class ImageOpener extends StatelessWidget {
  const ImageOpener({
    Key? key,
    required this.fullScreenImageUrl,
  }) : super(key: key);

  final String fullScreenImageUrl;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Image.network(
            fullScreenImageUrl,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ImageGridView2 extends StatelessWidget {
  int calculateColumnCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Adjust the image width and spacing as needed
    double desiredImageWidth = 300;
    double spacing = 4;
    int columnCount = (screenWidth / (desiredImageWidth + spacing)).floor();
    return columnCount > 1 ? columnCount : 1;
  }

  @override
  Widget build(BuildContext context) {
    MainGetController mainGetController = Get.put(MainGetController());
    return GetBuilder<MainGetController>(
      builder: (controller) {
        return FutureBuilder(
          future:
              controller.getData(), // Call getData() and wait for the result
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Container(
                  height: 50,
                  width: 150,
                  child: LoadingAnimation(),
                ),
              ); // Show loading indicator while waiting for data
            } else if (snapshot.hasError) {
              return Text(
                  'Error: ${snapshot.error}'); // Show error message if there's an error
            } else {
              String jsonData = snapshot.data!; // Get the data from the Future
              return Container(
                color: Color(0xFF48423F),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: calculateColumnCount(context),
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: jsonDecode(jsonData)['total'],
                  itemBuilder: (context, index) {
                    if (index == 199) {
                      Future.delayed(Duration.zero, () {
                        mainGetController.increment();
                        mainGetController.forUpdate();
                      });
                      return SizedBox.shrink();
                    } else {
                      int adjustedIndex = index > 199 ? index - 199 : index;
                      return ImageCard(
                        imageURL: jsonDecode(jsonData)["hits"][adjustedIndex]
                            ["largeImageURL"],
                        likesCount: jsonDecode(jsonData)["hits"][adjustedIndex]
                                ["likes"]
                            .toString(),
                        viewsCount: jsonDecode(jsonData)["hits"][adjustedIndex]
                                ["views"]
                            .toString(),
                        fullScreenImageUrl: jsonDecode(jsonData)["hits"]
                            [adjustedIndex]["largeImageURL"],
                      );
                    }
                  },
                ),
              );
            }
          },
        );
      },
    );
  }
}
