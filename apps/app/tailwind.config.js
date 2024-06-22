/** @type {import('tailwindcss').Config} */

module.exports = {
  content: [
    "./App.{js,jsx,ts,tsx}",
    "./app/**/*.{js,jsx,ts,tsx}",
    "./components/**/*.{js,jsx,ts,tsx}",
    "./constants/**/*.{js,jsx,ts,tsx}",
    "./hooks/**/*.{js,jsx,ts,tsx}"
  ],
  theme: {
    colors: {
      primary: {
        900: '#550F20',
        800: '#70132A',
        700: '#901936',
        600: '#B92045',
        500: '#CB234C',
        400: '#D54F70',
        300: '#DC6C87',
        200: '#E79AAD',
        100: '#EFBBC8',
        50: '#FAE9ED',
      },
      secondary: {
        900: '#64240E',
        800: '#832f13',
        700: '#A93D18',
        600: '#D94E1F',
        500: '#EE5622',
        400: '#F26B34',
        300: '#F48E6B',
        200: '#F7B199',
        100: '#FACBBA',
        50: '#FDEEE9'
      },
      danger: {
        500: '#FF1A30',
        400: '#FF4859',
        300: '#FF6674',
        200: '#FF96A0',
        100: '#FFB8BF'
      },
      success: {
        500: '#45D16C',
        400: '#6ADA89',
        300: '#82E09D',
        200: '#A9EABB',
        100: '#C5F1D1'
      },
      warning: {
        500: '#F9AA33',
        400: '#FABB5C',
        300: '#FBC676',
        200: '#FCD8A1',
        100: '#FDE5C0'
      },
      neutral: {
        900: '#550F20',
        800: '#70132A',
        700: '#901936',
        600: '#B92045',
        500: '#CB234C',
        400: '#D54F70',
        300: '#DC6C87',
        200: '#E79AAD',
        100: '#EFBBC8',
        50: '#FAE9ED'
      },
      route: {
        green: '#31CE8C',
        orange: '#FA9131',
        blue: '#233ECC',
        pink: '#F13478',
        purple: '#823EE1'
      },
      'off-white': '#F6F7FB',
      'cornflower-blue': '#6183FF',
      'light-gold': '#F9AA33',
      'brink-pink': '#FF6674',
      green: '#82E09D',
    },
    extend: {},
  },
  plugins: [],
}

