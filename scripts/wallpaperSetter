#!/usr/bin/perl

use strict;
use warnings;

my $wallpaper_dir = "$ENV{HOME}/Pictures/wallpapers";
my $i3_config_file = "$ENV{HOME}/.config/i3/config";
opendir(my $dir, $wallpaper_dir) or die "Cannot open directory: $!";
my @wallpapers = grep { -f "$wallpaper_dir/$_" } readdir($dir);
closedir($dir);
if (@wallpapers == 0) {
    die "No wallpapers found in $wallpaper_dir";
}
my $choice = `printf '%s\n' @wallpapers | dmenu -i -p "Select a wallpaper:"`;
chomp($choice);
if (!$choice) {
    print "No wallpaper selected.\n";
    exit;
}
my $selected_wallpaper = "$wallpaper_dir/$choice";
open(my $fh, '<', $i3_config_file) or die "Cannot open i3 config file: $!";
my @config_lines = <$fh>;
close($fh);
my $wallpaper_set = 0;
open($fh, '>', $i3_config_file) or die "Cannot write to i3 config file: $!";
foreach my $line (@config_lines) {
    if ($line =~ /^exec_always --no-startup-id feh --bg-fill /) {
        print $fh "exec_always --no-startup-id feh --bg-fill '$selected_wallpaper'\n";
        $wallpaper_set = 1;
    } else {
        print $fh $line;
    }
}
if (!$wallpaper_set) {
    print $fh "exec_always --no-startup-id feh --bg-fill '$selected_wallpaper'\n";
}
close($fh);
system("i3-msg restart");