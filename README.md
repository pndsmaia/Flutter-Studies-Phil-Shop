# phil_shop

A new Flutter application.

## Getting Started

##Migrate to AndroidX

##1. In file android/gradle/wrapper/gradle-wrapper.properties change the line thats start with distributionUrl like this (Can be that in your project already be of correctly form):

distributionUrl=https\://services.gradle.org/distributions/gradle-4.10.2-all.zip

##2. In File android/build.gradle, change:

dependencies {
    classpath 'com.android.tools.build:gradle:3.2.1'
}

replace to

dependencies {
    classpath 'com.android.tools.build:gradle:3.3.0'
}

##3. In file android/gradle.properties, add the following lines:

android.enableJetifier=true
android.useAndroidX=true

##4. In file android/app/build.gradle:

into of android {, make sure of your compileSdkVersion and targetSdkVersion are be value 28.

##5. In file android/app/build.gradle, replace the line

testInstrumentationRunner "android.support.test.runner.AndroidJUnitRunner"

replace to:

testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"

Finally, into of your dependencies {, change the lines



androidTestImplementation 'com.android.support.test:runner:1.0.2'
androidTestImplementation 'com.android.support.test.espresso:espresso-core:3.0.2'

replace to:

androidTestImplementation 'androidx.test:runner:1.1.1'
androidTestImplementation 'androidx.test.espresso:espresso-core:3.1.1'

##Plugins

cupertino_icons: ^0.1.2

font_awesome_flutter: ^8.4.0

flutter_staggered_grid_view: ^0.2.7

cloud_firestore: ^0.11.0+2

firebase_analytics: ^3.0.1

firebase_messaging: ^5.0.1+1

carousel_pro: ^0.0.13

transparent_image: ^1.0.0

scoped_model: ^1.0.1

path_provider: ^1.1.0

firebase_auth: ^0.11.1

url_launcher: ^5.0.2
