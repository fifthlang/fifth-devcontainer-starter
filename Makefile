.PHONY: all run clean prep help
.DEFAULT_GOAL := help

BUILD_DIR := build

all: $(BUILD_DIR)/main.dll  ## Build the project

prep:  ## Create build directory
	@mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/main.dll: main.5th | prep
	@echo "Building main.dll..."
	@fifth --source main.5th --output $(BUILD_DIR)/main.dll

run: $(BUILD_DIR)/main.dll  ## Build and run the program
	@echo "Running main.dll..."
	@dotnet $(BUILD_DIR)/main.dll

clean:  ## Remove build artifacts
	@echo "Cleaning build artifacts..."
	@rm -rf $(BUILD_DIR)

help:  ## Show this help message
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'