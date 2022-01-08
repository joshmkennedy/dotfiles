#! /usr/bin/env zx
$.verbose = false;
const spaces = {
  ["Google Chrome"]: 2,
  ["iTerm2"]: 3,
};
const windowsString = await $`yabai -m query --windows`;
const windows = JSON.parse(windowsString);
const arg = process.argv[3];
const appIsOpen = windows.find((window) => {
  const isIterm = window.app == arg;
  return isIterm;
});

if (!appIsOpen) {
  console.log(arg);
  $`yabai -m window --space ${spaces[arg]}`;
}
