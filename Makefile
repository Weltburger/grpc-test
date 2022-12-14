create:
	protoc --proto_path=proto proto/*.proto --go_out=gen/
	protoc --proto_path=proto proto/*.proto --go-grpc_out=gen/
	protoc -I . --grpc-gateway_out ./gen/ \
        --grpc-gateway_opt logtostderr=true \
        --grpc-gateway_opt paths=source_relative \
        --grpc-gateway_opt generate_unbound_methods=true \
        proto/test.proto

clean:
	rm gen/proto/*.go

docs:
	protoc -I . --openapiv2_out ./gen/ \
        --openapiv2_opt logtostderr=true \
        proto/test.proto

generate:
	cd proto; buf genetate

run:
	cd server; go rin server.go

clean:
	rm -rf proto
