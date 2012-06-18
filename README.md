protobuf-to-js
==============

Protocol Buffer Compiler Plugin To JavaScript

This is essentially a copy of http://code.google.com/p/protobuf-plugin-closure/
but I added a super simple Makefile to make building the JavaScript plugin easier.

The original depended on the Chromium source and the gyp build system;
this does not.  I also removed the cxx stuff because I only cared about generating
proto2/closure compliant JavaScript code.

To build, first download the protocol buffer compiler and build it.
The Makefile assumes the protobuf folder has the same ancestor as this directory.

FYI, I tested this using a Mac running OSX 10.7.3.  As a result, you will probably
need to change the location of the libraries to get the build to work.

Once you've compiled the js plugin, you can run it using
protoc --js_out=./ <proto file> --proto_path=<proto dir> --plugin=protoc-gen-js

which will generate the <proto file>.pb.js which should compile with the closure compiler.

