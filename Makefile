
PROTOBUF := ../protobuf-2.4.1
PROTOBUF_SOURCE := $(PROTOBUF)/src
PROTO_FILES := js/int64_encoding.proto js/javascript_package.proto
SOURCE_FILES := js/code_generator.cc js/protoc_gen_js.cc
PROTO_GEN_FILES_CC := $(patsubst %.proto, %.pb.cc, $(PROTO_FILES))

protoc-gen-js: $(PROTO_GEN_FILES_CC)
	g++ $(SOURCE_FILES) $(PROTO_GEN_FILES_CC) \
		-I . \
		-I $(PROTOBUF_SOURCE) \
		-L $(PROTOBUF_SOURCE)/.libs \
		-lprotobuf \
		-lprotoc \
		-o $@

js/%.pb.cc: js/%.proto
	$(PROTOBUF_SOURCE)/protoc --cpp_out=./js -I$(PROTOBUF_SOURCE) --proto_path=js $<

clean:
	rm -fr js/*.pb.*
	rm -fr js/protoc-gen-js
