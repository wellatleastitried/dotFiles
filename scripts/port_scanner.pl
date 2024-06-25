#!/usr/bin/perl

use strict;
use warnings;
use IO::Socket;
use Term::ANSIColor;

sub display_help() {
    print <<'END_HELP';
Usage: quickScan <host> <start-port> <end-port>

Arguments:
    <host>          - The target host to scan (e.g. 127.0.0.1)
    <start-port>    - The starting port number of the range to scan
    <end-port>      - The ending port number of the range to scan

Example:
    quickScan 127.0.0.1 1 1024

Description:
    This script scans a range of ports on a specified host to determine which ports are open or closed.

Options:
    --help          - Displays this help menu


END_HELP
    exit;
}
if (@ARGV == 1 && $ARGV[0] eq '--help') {
    display_help()
}
if (@ARGV != 3) {
    die "Usage: $0 <host> <start-port> <end-port>\n";
}
my ($host, $start_port, $end_port) = @ARGV;
my $timeout = 5;
sub scan_port {
    my ($host, $port) = @_;
    my $socket = IO::Socket::INET->new(
        PeerAddr => $host,
        PeerPort => $port,
        Proto    => 'tcp',
        Timeout  => $timeout
    );
    if ($socket) {
        close($socket);
        return 1;
    } else {
        return 0;
    }
}
for my $port ($start_port..$end_port) {
    if (scan_port($host, $port)) {
        print color('green'), "Port $port is open\n", color('reset');
    } else {
        print color('red'), "Port $port is closed\n", color('reset');
    }
}