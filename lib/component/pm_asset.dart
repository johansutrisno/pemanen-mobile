import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart' as p;

import '../core/constants/assets.dart';
import '../theme/theme.dart';

enum _AssetType { local, network }

class PmAsset extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final double? scale;
  final String? url;
  final _AssetType _type;
  final Widget? errorImage;
  final AlignmentGeometry? alignment;

  const PmAsset(
    this.imagePath, {
    Key? key,
    this.width,
    this.height,
    this.fit,
    this.scale,
    this.color,
    this.alignment,
  })  : url = null,
        _type = _AssetType.local,
        errorImage = null,
        super(key: key);

  const PmAsset.network(
    this.url, {
    Key? key,
    this.width,
    this.height,
    this.fit,
    this.scale,
    this.color,
    this.errorImage,
    this.alignment,
  })  : imagePath = '',
        _type = _AssetType.network,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imagePath.isEmpty && _type == _AssetType.local) {
      return Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      );
    }

    if (p.extension(imagePath) == '.svg') {
      return SvgPicture.asset(
        imagePath,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        color: color,
      );
    }

    if (_type == _AssetType.network) {
      if (url?.contains('.svg') == false) {
        return CachedNetworkImage(
          imageUrl: url ?? '',
          placeholder: (context, url) => const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: primary,
                strokeWidth: 2,
              ),
            ),
          ),
          errorWidget: (context, url, error) => SizedBox(
            width: width,
            height: height,
            child: errorImage ?? PmAsset(ImageAsset.getPath('logo-gram.jpg')),
          ),
          width: width,
          height: height,
          fit: fit,
        );
      } else {
        return SvgPicture.network(
          url ?? '',
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          color: color,
          placeholderBuilder: (context) => SizedBox(
            width: width,
            height: height,
            child: errorImage ?? Icon(Icons.image, size: width),
          ),
        );
      }
    }

    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      scale: scale,
      color: color,
      alignment: alignment ?? Alignment.center,
    );
  }
}
