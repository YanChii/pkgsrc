$NetBSD$

--- frontends/php/locale/make_mo.sh.orig	2019-02-04 09:57:37.000000000 +0000
+++ frontends/php/locale/make_mo.sh
@@ -1,5 +1,5 @@
 #!/bin/bash
 
-while read pofile; do
+find $(dirname $0) -type f ! -wholename '*/.svn*' -name '*.po' | while read pofile; do
         msgfmt --use-fuzzy -c -o ${pofile%po}mo $pofile || exit $?
-done < <(find $(dirname $0) -type f ! -wholename '*/.svn*' -name '*.po')
+done
