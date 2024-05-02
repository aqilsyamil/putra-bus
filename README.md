# PutraBus

[![Generic badge](https://img.shields.io/badge/api-red.svg)](https://putrabus-api.up.railway.app/)
![Generic badge](https://img.shields.io/badge/maintained-yes-green.svg)
![Badge](https://img.shields.io/endpoint?url=https%3A%2F%2Fhits.dwyl.com%2Faqilsyamil%2Fputra-bus.json%3Fcolor%3Dyellow)
![GitHub Repo stars](https://img.shields.io/github/stars/aqilsyamil/putra-bus)

PutraBus app is designed to enhance the UPM shuttle bus service by providing near real-time updates on bus location, estimated time of arrivals (ETA), and occupancy status. This monorepo, built using the NX framework, contains both the PutraBus mobile application and the PutraBus API.

- PutraBus Mobile Application: Developed with Flutter, offering an intuitive user interface for commuters.
- PutraBus API: Built using the Fastify framework, facilitating real-time data retrieval and updates for the mobile application.

<p align="center">
  <a href="https://www.youtube.com/watch?v=u61cDZzBcUg">
    <img src="https://img.youtube.com/vi/u61cDZzBcUg/0.jpg" />
  </a>
</p>

## Table of Contents

- [Overview](#putrabus)
- [Table of Contents](#table-of-contents)
- [Installation](#installation)
  - [Installing Package Manager](#installing-package-manager)
    - [Bun](#bun)
    - [Node & `npm`](#node--npm)
- [Quick Start](#quick-start)
  - [Flutter App](#flutter-app)
  - [API](#api)
- [Updating Repository](#updating-repository)
- [Contributors](#contributors)
- [License](#license)

## Installation

Clone repository via HTTPs

```git
git clone https://github.com/aqilsyamil/putra-bus.git
```

You need to install dependencies for the project. Dependencies is install by using a dependencies manager. We use bun and npm as our dependencies manager. You can install both bun and `npm` by refering to [our package manager installation section](#installing-package-manager).

If you have installed both bun and `npm`, you also need to install [Flutter](https://docs.flutter.dev/get-started/install) to work with PutraBus app. After installing Flutter, you need to also install [Android Studio](https://developer.android.com/studio/install) to emulate the app in an emulator (for Android).

After all mobile app environments has been install, open the repository or project in your local machine and run the following script in your CLI.

```bash
bun run install:project
```

To update existing dependencies, run the following.

```bash
bun run update:project:dependencies
```

### Installing Package Manager

#### Bun

To install Bun on macOS, Linux, or Windows Subsystem for Linux (WSL), execute the following curl command:

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

Bun can also be installed via npm, Homebrew, Docker, or Scoop package managers. For further installation refer to [Bun official documentation](https://bun.sh/docs/installation).

#### Node & `npm`

For installing Node.js and npm, utilize a Node version manager like `nvm` for managing multiple Node.js versions or use a Node installer if a version manager isn't feasible. To download the LTS version from the Node.js download page for macOS or Windows, and for Linux, consider using the NodeSource installer. For more instructions, refer to [this Node and `npm` installation guide](https://kinsta.com/blog/how-to-install-node-js/).

## Quick Start

Everytime you open this project, you need to install and update your project. To do that, make sure to create a `.env` file containing all required environment variables needed for this project. Put the file in the root directory of the project. Contact and ask [Rayhan](https://github.com/rayhanasyraff) to get the environment variables or you can [open an issue](https://github.com/aqilsyamil/putra-bus/issues/new). After setting up your `.env` file in your project, run this script to update the project.

```bash
bun run update:project:all
```

### Flutter App

To start PutraBus app, you first need to [run an emulator through Android studio](https://developer.android.com/studio/run/emulator). After you successfully run an emulator, run this script in root project.

```bash
bun run start:app:dev
```

### API

To start an API, make sure to create a `.env` file containing all required environment variables needed for this project. Put the file in the root directory of the project. Contact and ask [Rayhan](https://github.com/rayhanasyraff) to get the environment variables or you can [open an issue](https://github.com/aqilsyamil/putra-bus/issues/new). After setting up your `.env` file in your project, run this script to install all dependencies for this project.

```bash
bun run start:api:dev
```

To build an API for production, run the below script.

```bash
bun run build:api
```

You then can run the API in production by running this script.

```bash
bun run start:api:prod
```

## Updating Repository

Any commit changes in dev branch need to be refelected and merge in your feature branch. To do so, make sure you are in your feature branch.

```bash
git branch
```

If you're in the feature branch, run the below to merge with dev branch. Merge with caution.

```bash
git merge dev
```

Please make a pull request first before pushing your commit changes of feature branch to main or dev branch.

## Contributors

<a href="https://github.com/aqilsyamil/putra-bus/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=aqilsyamil/putra-bus" />
</a>

## License

This project is licensed under UPM.

Note: PutraBus app aims to improve transportation infrastructure for the UPM community.
