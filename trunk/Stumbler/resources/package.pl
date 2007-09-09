#!/bin/perl
use File::Slurp;
use Archive::Zip;
$nl = "\n";
$VERSION_FILE = '../VERSION';
$version = read_file($VERSION_FILE);
chomp($version);
require "package.config";

# Generate Zip File
$zip = Archive::Zip->new();
$zip->addTree($name.'.app',$name.'.app');
$zip->overwriteAs($name.'-'.$version.'.zip');
$mode = 0664;
chmod $mode, $name.'-'.$version.'.zip';
$installer_size = -s $name.'-'.$version.'.zip';

# Generate Installer.app plist
$installer_filename = $name.'.plist';
$installer_contents = "";
$installer_contents = '<?xml version="1.0" encoding="UTF-8"?>'.$nl;
$installer_contents .= '<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">'.$nl;
$installer_contents .= '<plist version="1.0">'.$nl;
$installer_contents .= '<dict>'.$nl;
$installer_contents .= '	<key>bundleIdentifier</key>'.$nl;
$installer_contents .= '	<string>'.$bundleIdentifier.'</string>'.$nl;
$installer_contents .= '	<key>name</key>'.$nl;
$installer_contents .= '	<string>'.$name.'</string>'.$nl;
$installer_contents .= '	<key>version</key>'.$nl;
$installer_contents .= '	<string>'.$version.'</string>'.$nl;
$installer_contents .= '	<key>location</key>'.$nl;
$installer_contents .= '	<string>'.$installer_location.'</string>'.$nl;
$installer_contents .= '	<key>size</key>'.$nl;
$installer_contents .= '	<string>'.$installer_size.'</string>'.$nl;
$installer_contents .= '	<key>url</key>'.$nl;
$installer_contents .= '	<string>'.$url.'</string>'.$nl;
$installer_contents .= '	<key>description</key>'.$nl;
$installer_contents .= '	<string>'.$description.'</string>'.$nl;
$installer_contents .= '	<key>scripts</key>'.$nl;
$installer_contents .= '	<dict>'.$nl;
$installer_contents .= '		<key>install</key>'.$nl;
$installer_contents .= '		'.$installer_installscript.$nl;
$installer_contents .= '		<key>uninstall</key>'.$nl;
$installer_contents .= '		'.$installer_uninstallscript.$nl;
$installer_contents .= '	</dict>'.$nl;
$installer_contents .= '</dict>'.$nl;
$installer_contents .= '</plist>'.$nl;
open (MYFILE, ">$name.plist");
print MYFILE $installer_contents;
close(MYFILE);
