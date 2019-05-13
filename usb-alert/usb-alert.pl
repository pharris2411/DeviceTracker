#!/usr/bin/env perl

use strict;
use warnings;
use JSON;
use LWP::UserAgent;
use HTTP::Request;

my $url = 'http://127.0.0.1:8080/update';

my $json = {};

sub try_env {
    my @allowed = @_;
    foreach my $k (@allowed) {
        if(exists($ENV{$k})) {return $ENV{$k};}
    }
    return undef;
}

sub decode {
    my $str = shift;
    if(!defined($str)) { return undef; }
    my @matches = ( $str =~ m/\\x(..)/g );
    if(@matches > 0) {
        foreach my $hex (@matches) {
            my $ch = chr(hex($hex));
            $str =~ s/\\x$hex/$ch/g;
        }

    }
    return $str;
}

$json->{'state'} = decode(try_env('ACTION'));
$json->{'serial'} = decode(try_env('ID_SERIAL_SHORT','ID_SERIAL'));

$json->{'vendor'} = decode(try_env('ID_VENDOR_FROM_DATABASE','ID_VENDOR_ENC','ID_VENDOR'));
$json->{'vendor_id'} = decode(try_env('ID_VENDOR_ID'));

$json->{'model'} = decode(try_env('ID_MODEL_ENC','ID_MODEL'));
$json->{'model_id'} = decode(try_env('ID_MODEL_ID'));

my $ua = LWP::UserAgent->new;
my $req = HTTP::Request->new('POST',$url);
$req->header('Content-Type' => 'application/json');
$req->content(encode_json($json));
my $res = $ua->request($req);

exit(0);
