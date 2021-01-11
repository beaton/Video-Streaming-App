# Video on Demand Application

Welcome to my playground. This is simply an opportunity to play with **Flutter** in an effort to learn - suggestions welcome.

FYI there is interest in supporting 10ft devices, starting with Roku: https://github.com/flutter/flutter/issues/37159 but as of yet, nothing available.

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
