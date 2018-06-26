#!/bin/sh

SOURCEDIR=$1
[ -n "$SOURCEDIR" ] && SOURCEDIR="$SOURCEDIR/"

if (sed -n 's/.*<xi:include href="dbus-\(.*\.xml\)".*/\1\n\1/p' $SOURCEDIR''docs/api/network-manager-docs.xml;
    cd $SOURCEDIR''introspection; ls *.xml) |sort |uniq -u| grep . >&2; then
	echo "*** Error: D-Bus interfaces not included in docs/api/network-manager-docs.xml ***" >&2
	exit 1
fi

exit 0
