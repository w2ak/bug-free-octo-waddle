.PHONY: all imports

SQLFILES:=$(wildcard *.sql)
OUTFILES:=$(patsubst %.sql,%.out,$(SQLFILES))

all: $(OUTFILES)

%.out: %.sql
	time --output=$*.time psql inf553dp -f $< > $@

imports:
	rm -f imports/*.sql
	./.makeimports
	cat imports/*.sql | sed -n '/^DROP/ p;' > imports/drops.tmp
	echo "VACUUM;" >> imports/drop.tmp
	cat imports/*.sql | sed '/^DROP/ d;' > imports/create.tmp
	cat imports/drops.tmp imports/create.tmp > imports/import.sql
	rm -f imports/*.tmp
