# Video on Demand Application

Welcome to my playground. This is simply an opportunity to play with **Flutter** in an effort to learn - contributions welcome.

<img src="avod-recording.gif" width="223" height="454"/>

## Getting Started

A few resources to get you started:

For help getting started with Flutter, check out
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Configuration

Minimum configurtion (tested)

* Flutter 1.22.5 • channel stable • https://github.com/flutter/flutter.git
* Framework • revision 7891006299 (9 days ago) • 2020-12-10 11:54:40 -0800
* Engine • revision ae90085a84
* Tools • Dart 2.10.4

Don't forget to run Flutter doctor immediately after the installation.

### Configuration file

You will need to create the following configuration file: /assets/cfg/properties.json

With the following contents, 
```
{
  "tmdbApiKey": "TMDB APIKey",
  "tmdbJacketBaseUrl": "https://image.tmdb.org/t/p/w200",
  "tmdbBannerBaseUrl": "https://image.tmdb.org/t/p/w400",
  "language": "en-US"
}
```
TMDB APIkey can be obtained for free from https://developers.themoviedb.org/3

## Platform support

Although I've focused entirely on iOS and specifically the iPhone form factor at this point, there is support for a variety of platforms available today or in development by the Flutter team or other contributors from the open source community,

* Desktop: desktop support is in preview for Windows, macOS, and Linux.
* Web: There is support for Web: https://flutter.dev/web (no browser plug-in required).
* Roku: There is interest in supporting Roku: https://github.com/flutter/flutter/issues/37159 but as of yet, nothing available.
* Tizen: There is active development underway for Tizen support: https://github.com/flutter-tizen/flutter-tizen
* UWP: There is active development underway for Windows 10 desktop, Windows 10x emulator and XBOX: https://github.com/clarkezone/fluttergalleryuwp
