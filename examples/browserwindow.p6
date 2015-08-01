#!/usr/bin/env perl6

use v6;

use lib 'lib';

use Atom::Electron;


my $app = Atom::Electron::App.instance;
LEAVE {
  $app.destroy;
}

my $win = Atom::Electron::BrowserWindow.new(:x(100), :y(100), :width(1024), :height(768), :show(False));

$win.load_url("http://www.google.com");

$win.on-minimize( sub {
  "Window minimized!".say;
});

$win.on-maximize( sub {
  "Window maximized!".say;
});

$win.on-devtools-closed( sub {
  "Dev tools closed!".say;
});

$win.show;

$app.event_loop;

prompt("Press any key to exit");
