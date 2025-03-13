# InspireFace Android SDK

## Source Code Project

If you need to learn about the build steps in the source code of the project, you can go : [InspireFace](https://github.com/HyperInspire/InspireFace).

## Supporting Platform
- arm64-v8a 
- armeabi-v7a

## Add Dependency
Add Jitpack dependencies to your Gradle configuration.

```groovy
allprojects {
	repositories {
		...
		maven { url 'https://jitpack.io' }
	}
}
```

Add dependencies in build.gradle for projects where you need InspireFace

```groovy
dependencies {
        implementation 'com.github.HyperInspire:inspireface-android-sdk:1.2.0'
}
```

