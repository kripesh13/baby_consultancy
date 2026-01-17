import 'package:baby_eduction/const/asset_path.dart';
import 'package:baby_eduction/const/color_schemas.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class KCachedNetworkImage extends StatelessWidget {
  const KCachedNetworkImage({
    Key? key,
    required this.image,
    this.isNetwork = false,
    this.fit,
    this.view,
    this.height,
    this.width,
    this.borderRadius,
    this.errorWidget,
    this.loadingWidget,
  }) : super(key: key);

  final String image;
  final bool isNetwork;
  final double? height;
  final double? width;
  final double? borderRadius;
  final bool? view;
  final BoxFit? fit;
  final Widget? errorWidget;
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: view == true ? () {} : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        child: isNetwork
            ? CachedNetworkImage(
                imageUrl: image,
                height: height ?? 170,
                width: width ?? double.infinity,
                fit: fit ?? BoxFit.cover,
                placeholder: (context, url) => Center(
                  child:
                      loadingWidget ??
                      CircularProgressIndicator(color: AppColors.greyColor),
                ),
                errorWidget: (context, url, error) => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child:
                      errorWidget ??
                      Image.asset(
                        AssetPath.appLogo,
                        height: height,
                        fit: fit ?? BoxFit.cover,
                      ),
                ),
              )
            : Image.asset(
                image,
                height: height ?? 170,
                width: width ?? double.infinity,
                fit: fit ?? BoxFit.cover,
              ),
      ),
    );
  }
}
