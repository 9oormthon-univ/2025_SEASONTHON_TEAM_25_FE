enum ButtonWidth { large, medium, small }

extension ButtonWidthValue on ButtonWidth {
  double get value {
    switch (this) {
      case ButtonWidth.large:
        return 335;
      case ButtonWidth.medium:
        return 225;
      case ButtonWidth.small:
        return 90;
    }
  }
}
