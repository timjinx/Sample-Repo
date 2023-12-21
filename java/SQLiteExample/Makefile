JFLAGS = -g -cp .:lib/sqlite-jdbc-3.34.0.jar
JC = javac
.SUFFIXES: .java .class
.java.class:
	$(JC) $(JFLAGS) $*.java

CLASSES = SQLiteHandler.java runRevisionExtractor.java

default: classes

classes: $(CLASSES:.java=.class)

clean:
	$(RM) *.class
