#Variables
GO = go
PROJECT_DIR = $(shell pwd)
GQLGEN = github.com/99designs/gqlgen
DB_URL = mongodb://root:password@localhost:27017
DB_NAME = cv_manager

#Environment
PORT = 8080


#$env:DB_NAME="cv_manager"
#$env:DB_URL="mongodb://root:password@localhost:27017"
#$env:PORT="8080"


#Commands
build:
	@echo "=> (1/2) Construindo servidor..."
	@$(GO) build -o $(PROJECT_DIR)/bin/server $(PROJECT_DIR)/server.go
	@echo "=> (2/2) Servidor construído em: $(PROJECT_DIR)/bin/server"

run: build
	@echo "=> (1/1) Iniciando servidor..."
	@DB_NAME=$(DB_NAME) DB_URL=$(DB_URL) PORT=$(PORT) $(PROJECT_DIR)/bin/server

gen:
	@echo "=> (1/2) Gerando GraphQL schema..."
	@$(GO) run $(GQLGEN) generate
	@echo "=> (2/2) Schema gerado com sucesso..."

clean:
	@echo "=> (1/2) Limpando projeto..."
	@rm -rf $(PROJECT_DIR)/bin
	@echo "=> (2/2) $(PROJECT_DIR)/bin limpo..."

up:
	@echo "=> (1/2) Subindo containers..."
	@docker compose up -d
	@echo "=> (2/2) Containers subidos."

.DEFAULT_GOAL = run