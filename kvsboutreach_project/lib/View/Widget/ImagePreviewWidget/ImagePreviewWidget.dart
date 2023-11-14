import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  final String imageUrl;

  const ImagePreview({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {

    final ImageProvider cachedImageProvider = CachedNetworkImageProvider(imageUrl);

    return GestureDetector(
      onTap: () => _ImagePreviewDialog.showPreviewDialog(context, cachedImageProvider),
      child: Hero(
        tag: imageUrl,
        child: Container(
          height: 700,

          decoration: BoxDecoration(
            image: DecorationImage(
              image: cachedImageProvider,
              fit: BoxFit.fitWidth,
            ),
          )
        ),
      ),
    );
  }
}

class _ImagePreviewDialog  extends StatelessWidget {

  final ImageProvider  imageUrl;
  _ImagePreviewDialog (this.imageUrl);

  static void showPreviewDialog(BuildContext context, ImageProvider imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _ImagePreviewDialog (imageUrl);
      },
    );
  }
  final _transformationController = TransformationController();
  TapDownDetails _doubleTapDetails = TapDownDetails();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Stack(
        children: [
          Hero(
            tag: imageUrl,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onDoubleTapDown: (d) => _doubleTapDetails = d,
                onDoubleTap: _handleDoubleTap,
                child: ConstrainedBox(
                  constraints: const BoxConstraints.expand(),
                  child: InteractiveViewer(
                    clipBehavior: Clip.none,
                    maxScale: 5.0,
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageUrl,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      )
                    ),
                  ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }

  void _handleDoubleTap() {
    if (_transformationController.value != Matrix4.identity()) {
      _transformationController.value = Matrix4.identity();
    } else {
      final position = _doubleTapDetails.localPosition;
      // For a 3x zoom
      _transformationController.value = Matrix4.identity()
        ..translate(-position.dx * 2, -position.dy * 2)
        ..scale(3.0);
      // Fox a 2x zoom
      // ..translate(-position.dx, -position.dy)
      // ..scale(2.0);
    }
  }
}

