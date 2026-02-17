SRC_DIR = src
SRC_SUBDIRS = $(shell find $(SRC_DIR) -type d)
SRCS = $(shell find $(SRC_DIR) -type f -name "*.cpp")

INC_DIR = include
INC_FLAGS = -I$(INC_DIR) $(addprefix -I,$(SRC_SUBDIRS))

OBJ_DIR = obj
OBJS = $(SRCS:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

BIN_DIR = bin

CXX = clang++
CXXFLAGS = -Wall -Wextra -Werror -Wpedantic -g -std=c++23 $(INC_FLAGS)
LDFLAGS =

TARGET = prog

all: $(TARGET)

$(TARGET): $(OBJS) | $(BIN_DIR)
	$(CXX) $(OBJS) -o $@ $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(BIN_DIR) $(OBJ_DIR):
	mkdir -p $@

clean:
	@rm -rf $(OBJ_DIR) $(BIN_DIR)

print-%:
	@echo $* = $($*)

.PHONY: all clean print-%
