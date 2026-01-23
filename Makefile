BUILD_RELEASE = build/src
BUILD_DEBUG = build/debug

source = main.cpp

OBJECT_RELEASE = $(patsubst %.cpp,$(BUILD_RELEASE)/%.o,$(source))
OBJECT_DEBUG = $(patsubst %.cpp,$(BUILD_DEBUG)/%.o,$(source))

all: $(OBJECT_RELEASE)
	g++ -o a.out $^

debug: $(OBJECT_DEBUG)
	g++ -o b.out $^

$(BUILD_RELEASE)/%.o: %.cpp
	mkdir -p $(BUILD_RELEASE)
	g++ -c -O3 -o $@ $<

$(BUILD_DEBUG)/%.o: %.cpp
	mkdir -p $(BUILD_DEBUG)
	g++ -c -O3 -g3 -o $@ $<

clean:
	rm -f $(BUILD_RELEASE)/*.o
	rm -f $(BUILD_DEBUG)/*.o