#!/usr/bin/perl

use strict;

main();

sub main {
	
	while (<>) {

		if (/^ServerRoot: /) {
			print $_;
			print "PidFile: /home/oogasawa/logs/pidfile001.pid\n";
		}
		elsif (/^Listen: /) {
			print "Listen: 60000\n";
		}
		elsif (/^ErrorLog /) {
			print "ErrorLog /home/oogasawa/logs/error_log\n";
		}
		elsif (/^\s+CustomLog /) {
			print "CustomLog ", "/home/oogasawa/logs/access_log", " combined \n";
		}
		else {
			print $_;
		}
	}

}
