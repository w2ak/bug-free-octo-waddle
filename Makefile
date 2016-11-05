.PHONY: all

%.out:
	psql inf553dp -f $*.sql > $@
