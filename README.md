# InspireFace Android SDK

[![GitHub release](https://img.shields.io/github/v/release/HyperInspire/InspireFace.svg?style=for-the-badge&color=blue&label=Github+release&logo=github)](https://github.com/HyperInspire/InspireFace/releases/latest)
[![Model](https://img.shields.io/github/v/release/HyperInspire/InspireFace.svg?style=for-the-badge&color=blue&label=Model+Zoo&logo=github)](https://github.com/HyperInspire/InspireFace/releases/tag/v1.x)
[![JitPack](https://img.shields.io/jitpack/v/github/HyperInspire/inspireface-android-sdk?style=for-the-badge&color=green&label=JitPack&logo=android)](https://jitpack.io/#HyperInspire/inspireface-android-sdk)

InspireFace is a cross-platform face recognition SDK developed in C/C++, supporting multiple operating systems and various backend types for inference, such as CPU, GPU, and NPU.

If you require further information on tracking development branches, CI/CD processes, or downloading pre-compiled libraries, please visit our [development repository](https://github.com/HyperInspire/InspireFace).

Please contact [contact@insightface.ai](mailto:contact@insightface.ai?subject=InspireFace) for commercial support, including obtaining and integrating higher accuracy models, as well as custom development.

## Source Code Project

If you need to learn about the build steps in the source code of the project, you can go : [InspireFace](https://github.com/HyperInspire/InspireFace).

## Supporting Platform
- arm64-v8a 
- armeabi-v7a

## Add Dependency

- Step 1. Add the JitPack repository to your build file add it in your root **build.gradle** at the end of repositories:

  ```groovy
  allprojects {
      repositories {
         ...
         maven { url 'https://jitpack.io' }
      }
  }
  ```

- Step 2. Add the dependency

  ```groovy
  dependencies {
      implementation 'com.github.HyperInspire:inspireface-android-sdk:1.2.0'
  }
  ```

## How to use the Android/Java Api

We provide a Java API for Android devices, which is implemented using Java Native Interface(JNI). 

```java
// Launch InspireFace, only need to call once
boolean launchStatus = InspireFace.GlobalLaunch(this, InspireFace.PIKACHU);
if (!launchStatus) {
    Log.e(TAG, "Failed to launch InspireFace");
}

// Create a ImageStream
ImageStream stream = InspireFace.CreateImageStreamFromBitmap(img, InspireFace.CAMERA_ROTATION_0);

// Create a session
CustomParameter parameter = InspireFace.CreateCustomParameter()
                .enableRecognition(true)
                .enableFaceQuality(true)
                .enableFaceAttribute(true)
                .enableInteractionLiveness(true)
                .enableLiveness(true)
                .enableMaskDetect(true);
Session session = InspireFace.CreateSession(parameter, InspireFace.DETECT_MODE_ALWAYS_DETECT, 10, -1, -1);

// Execute face detection
MultipleFaceData multipleFaceData = InspireFace.ExecuteFaceTrack(session, stream);
if (multipleFaceData.detectedNum > 0) {
    // Get face feature
    FaceFeature feature = InspireFace.ExtractFaceFeature(session, stream, multipleFaceData.tokens[0]);
    // ....
}

// .... 

// Release resource
InspireFace.ReleaseSession(session);
InspireFace.ReleaseImageStream(stream);

// Global release
InspireFace.GlobalRelease();
```

