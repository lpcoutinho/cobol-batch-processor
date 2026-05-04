# Makefile para Projeto COBOL Profissional

# Compilador
COBC = cobc

# Flags de Compilação
FLAGS_FIXED = -x -O2
FLAGS_FREE  = -x -free -O2

# Pastas
SRC_FIXED = src/pgm/fixed
SRC_FREE  = src/pgm/free
BIN_DIR   = bin

# Alvos principais
all: setup build-fixed build-free

setup:
	mkdir -p $(BIN_DIR)

build-fixed: setup
	$(COBC) $(FLAGS_FIXED) -o $(BIN_DIR)/processa-fixed $(SRC_FIXED)/PROCESSA.cob

build-free: setup
	$(COBC) $(FLAGS_FREE) -o $(BIN_DIR)/processa-free $(SRC_FREE)/PROCESSA.cob

run-fixed:
	./$(BIN_DIR)/processa-fixed

run-free:
	./$(BIN_DIR)/processa-free

clean:
	rm -rf $(BIN_DIR)
	rm -f *.lst
