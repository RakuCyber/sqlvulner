use strict;

use warnings;

use LWP::Simple;

use Term::ANSIColor;

my $datetime = localtime;

if ($^O =~ /MSWin32/) {system("cls"); }else { system("clear"); }

print color('bold green');

print q(

      ⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⡿⠋⢹⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀
⠀⠀⠀⣴⣿⠟⣿⣿⣿⣿⣿⣿⣿⠟⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⠻⣿⣦⠀⠀⠀
⠀⢠⣾⡿⠋⣼⣿⣿⣿⣿⣿⣿⡏⠀⠀⠘⠻⠿⢿⣿⣿⣿⣿⣿⣧⠙⢿⣷⡄⠀
⢰⣿⡟⠀⠀⣿⣿⣧⡈⠉⠛⠿⠁⢠⣶⣶⡀⠀⠀⠈⠻⢿⣿⣿⣿⠀⠀⢻⣿⡆
⠈⢿⣿⣄⠀⣿⣿⣿⣿⣦⣄⡀⠀⠈⠛⠛⠀⢸⣷⣶⣤⣈⣿⣿⣿⠀⣠⣿⡿⠁
⠀⠀⠻⣿⣧⡸⣿⣿⣿⣿⣿⣿⣿⣷⡆⠀⢀⣿⣿⣿⣿⣿⣿⣿⢇⣴⣿⠟⠀⠀
⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠙⠿⣿⣿⣿⣿⣿⣧⣶⣿⣿⣿⣿⣿⣿⣿⠿⠛⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠛⠿⠿⠿⠿⠿⠿⠟⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

);

print color('reset');

print "                       ";

print colored ("[ R Raku v2.1 ]",'white on_red');

print colored ("[ Coded By Raku 8200 ]\n",'white on_red');

print "                           ";

print colored ("[ Start At $datetime ]",'white on_red'),"\n\n";

my $file = shift;

open(my $fh, '<', $file) or die "Failed to open file $file: $!";

while (my $url = <$fh>) {

    chomp $url;

    my $page = get($url);

    if (defined $page) {

        my ($query_string) = ($url =~ m/\?(.*)/);

        if ($query_string =~ m/(\?|\&)select\b/i || $query_string =~ m/\bfrom\b/i) {

            print "SQL injection vulnerability found in $url\n";

        }

        if ($page =~ m/(\bselect\b|\bunion\b|\bfrom\b)/i) {

            print "SQL injection vulnerability found in $url\n";

        }

    } else {

        print "NO SQL injection vulnerability $url\n";

    }

}

close($fh);
