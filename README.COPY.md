# PutraBus

![Generic badge](https://img.shields.io/badge/maintained-yes-green.svg)
[![Generic badge](https://img.shields.io/badge/api-run-red.svg)](https://putra-bus-production.up.railway.app/)

PutraBus App is designed to enhance the UPM shuttle bus service by providing real-time updates on bus location, estimated time of arrivals (ETA), and occupancy status. This monorepo, built using the NX framework, contains both the PutraBus mobile application and the PutraBus API.

- PutraBus Mobile Application: Developed with Flutter, offering an intuitive user interface for commuters.
- PutraBus API: Built using the Fastify framework, facilitating real-time data retrieval and updates for the mobile application.

<iframe width="774" height="435" src="https://www.youtube.com/watch?feature=shared&v=u61cDZzBcUg">
</iframe>

## Table of Contents

- [Overview](#putrabus)
- [Table of Contents](#table-of-contents)
- [Quick Start](#quick-start)
- [Usage](#usage)
  - [Flutter App](#flutter-app)
  - [API](#api)
- [Contributors](#contributors)
- [License](#license)

## Quick Start

Clone repository via HTTPs

```git
git clone https://github.com/aqilsyamil/putra-bus.git
```

You need to install dependencies. Dependencies is install by using a dependencies manager such as bun and node. To install Bun on macOS, Linux, or Windows Subsystem for Linux (WSL), execute the following curl command:

```bash
curl -fsSL https://bun.sh/install | bash
```

For installing a specific version, use:

```bash
curl -fsSL https://bun.sh/install | bash -s "bun-v1.0.0"
```

Ensure that your Linux system has the unzip package installed, and it's recommended to have a kernel version of 5.6 or higher. To check the kernel version, use uname -r.

For Windows installation, ensure you have at least Windows 10 version 1809 and run the following PowerShell command:

```bash
powershell -c "irm bun.sh/install.ps1|iex"
```

Bun can also be installed via npm, Homebrew, Docker, or Scoop package managers.

For installing Node.js and npm, utilize a Node version manager like nvm for managing multiple Node.js versions or use a Node installer if a version manager isn't feasible. To download the LTS version from the Node.js download page for macOS or Windows, and for Linux, consider using the NodeSource installer.

After installing the dependecies manager, we need to install the dependencies. Here I'm using bun but you may also use npm.

```arduino
bun install
```

You also need to install [Flutter](https://docs.flutter.dev/get-started/install) to work with PutraBus app. After installing Flutter, you need to also install [Android Studio](https://developer.android.com/studio/install) to emulate the app in an emulator (for Android).

After all mobile app environments has been install, you need to install all dependencies for the Flutter mobile application.

```arduino
flutter pub get
```

## Usage

Everytime you open this project, make sure to install and update your dependencies. Make sure you are in root project and not in any app folder.

```arduino
bun run update:project
```

### Flutter App

To start PutraBus app, you first need to [run an emulator through Android studio](https://developer.android.com/studio/run/emulator). After you successfully run an emulator, run this script in root project.

```arduino
bun run start:app:dev
```

### API

To start an API, make sure you have .env file in root project. Ask me (Rayhan) to get this file. After that, you can start the API in development by running the below script.

```arduino
bun run start:api:dev
```

To build an API for production, run the below script.

```arduino
bun run build:api
```

You then can run the API in production by running this script.

```arduino
bun run start:api:prod
```

## Contributors



## License

This project is licensed under UPM.

Note: PutraBus App aims to improve transportation infrastructure for the UPM community.
