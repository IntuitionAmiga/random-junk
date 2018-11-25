# Common include for building the interpreter

OBJ      = obj/$(ARCH)/interpreter.o \
           obj/$(ARCH)/standalone.o

$(BIN): $(OBJ) Makefile.$(MEXT)
	$(CXX) $(CXXFLAGS) $(OBJ) -o $(BIN)

obj/$(ARCH)/interpreter.o: src/interpreter.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $<

obj/$(ARCH)/standalone.o: src/standalone.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $<

clean:
	$(RM) $(TARGET) obj/$(ARCH)/*.o *~ core


