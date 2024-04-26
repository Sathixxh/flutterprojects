class Magazine {
  const Magazine({
    required this.assetImage,
  });

  final String assetImage;

  static final List<Magazine> fakeMagazinesValues = List.generate(
    29,
    (index) => Magazine(
      assetImage: 'assets/gif/vice/Temp${index + 1}.png',
    ),
  );
}
