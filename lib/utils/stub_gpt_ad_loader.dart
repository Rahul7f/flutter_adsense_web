class GptAdLoaderImpl {
  void registerGptAdLoader() {
    // Empty implementation for non-web platforms
    print("GptAdLoaderWeb Not registered");
  }
}

GptAdLoaderImpl createPlatformGptAdLoader() => GptAdLoaderImpl();
