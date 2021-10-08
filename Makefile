postgres:
	docker run --name postgres14_alpine -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=Light2901 -d postgres:alpine

createdb:
	docker exec -it postgres14_alpine createdb --username=root --owner=root simple_bank

dropdb:
	docker exect -it postgres14_alpine dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:Light2901@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:Light2901@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test