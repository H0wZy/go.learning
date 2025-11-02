#Variables
GO = go
PROJECT_DIR = $(CURDIR)
GQLGEN = github.com/99designs/gqlgen

#Environment
PORT = 9090

#Commands
build:
	@echo "=> (1/2) Construindo servidor..."
	@$(GO) build -o $(PROJECT_DIR)/bin/server $(PROJECT_DIR)/server.go
	@echo "=> (2/2) Servidor construído em: $(PROJECT_DIR)/bin/server"

run:
	@echo "=> (1/1) Iniciando servidor..."
	@PORT=$(PORT) $(PROJECT_DIR)/bin/server

gen:
	@echo "=> (1/2) Gerando GraphQL schema..."
	@$(GO) run $(GQLGEN) generate
	@echo "=> (2/2) Schema gerado com sucesso..."

clean:
	@echo "=> (1/2) Limpando projeto..."
	@rm -rf $(PROJECT_DIR)/bin
	@echo "=> (2/2) $(PROJECT_DIR)/bin limpo..."

