FROM golang:1.22.3-alpine3.19 AS builder

WORKDIR /app

COPY go.mod *go.sum ./

RUN go mod download && go mod verify

COPY . ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o ./tweeter-action ./cmd/tweeter-action/main.go 

FROM scratch

COPY --from=builder /app/tweeter-action ./tweeter-action

ENTRYPOINT [ "/tweeter-action" ]
