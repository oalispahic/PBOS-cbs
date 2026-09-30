PROJECT = cbs

SRC = src
BIN = bin
BUILD = build

FPC = fpc

FPCFLAGS = \
	-Fu$(SRC) \
	-Fu$(SRC)/cbs \
	-Fu$(SRC)/accounts \
	-Fu$(SRC)/ledger \
	-Fu$(SRC)/transactions \
	-Fu$(SRC)/authorization \
	-Fu$(SRC)/terminals \
	-Fu$(SRC)/reconciliation \
	-Fu$(SRC)/protocol \
	-Fu$(SRC)/database \
	-Fu$(SRC)/common \
	-Fo$(BUILD)/

.PHONY: all build run clean

all: build

build:
	mkdir -p $(BIN) $(BUILD)
	$(FPC) $(FPCFLAGS) -o$(BIN)/$(PROJECT) $(SRC)/main.pas

run: build
	./$(BIN)/$(PROJECT)

clean:
	rm -rf $(BUILD)
	rm -f $(BIN)/$(PROJECT)
