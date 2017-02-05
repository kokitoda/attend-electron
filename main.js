'use strict';

const electron = require('electron');
const app = electron.app;
const BrowserWindow = electron.BrowserWindow;

let win;

function createwindow(){
  win = new BrowserWindow({width: 400, height: 400});
  win.loadURL('file://' + __dirname + '/index.html');
  win.on('closed', function(){
    win = null;
  });
}

app.on('ready', function(){
  createwindow();
});
