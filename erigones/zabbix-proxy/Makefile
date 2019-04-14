# $NetBSD: Makefile,v 1.11 2018/04/29 21:32:05 adam Exp $

# PKGREVISION= 3
PKGREVISION= 2

.include "Makefile.common"

COMMENT=	Zabbix monitoring proxy compiled to use SQLite

DEPENDS+=	fping-[0-9]*:../../net/fping

USE_TOOLS+=		pax pkg-config
GNU_CONFIGURE=		yes
#CONFIGURE_ARGS+=	--enable-agent
CONFIGURE_ARGS+=	--enable-proxy
CONFIGURE_ARGS+=	--disable-server
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--with-iconv=${BUILDLINK_PREFIX.iconv}
#CONFIGURE_ARGS+=	--with-jabber
#CONFIGURE_ARGS+=	--with-ldap=${BUILDLINK_PREFIX.openldap-client}
#CONFIGURE_ARGS+=	--with-libcurl
#CONFIGURE_ARGS+=	--with-libxml2
CONFIGURE_ARGS+=	--with-openssl=${BUILDLINK_PREFIX.openssl}
CONFIGURE_ARGS+=        --with-libpcre=${BUILDLINK.PREFIX.pcre}
CONFIGURE_ARGS+=	--with-zlib=${BUILDLINK.PREFIX.zlib}
CONFIGURE_ARGS+=	--with-fping=${BUILDLINK.PREFIX.fping}

PKG_SYSCONFSUBDIR=zabbix
EGDIR=		share/examples/zabbix
CONF_FILES+=	${EGDIR}/zabbix_proxy.conf ${PKG_SYSCONFDIR}/zabbix_proxy.conf

RCD_SCRIPTS=	zabbix_proxy 

INSTALLATION_DIRS+=	${EGDIR} share/zabbix

SUBST_CLASSES+=		fix-paths
SUBST_STAGE.fix-paths=	pre-configure
SUBST_MESSAGE.fix-paths=Fixing absolute paths.
SUBST_FILES.fix-paths=	conf/*.conf
SUBST_FILES.fix-paths+=	man/*.man
SUBST_SED.fix-paths=	-e 's,/usr/local/etc,${PKG_SYSCONFBASE},g'

.include "../../mk/bsd.prefs.mk"

# ZABBIX user account
ZBXUSER?=			zabbix
ZBXGROUP?=			zabbix
ZBXUID?=			993
ZBXGID?=			993
ZBXHOME?=			${VARBASE}/${ZBXUSER}
ZBXLOGDIR?=			${VARBASE}/log/zabbix
ZBXPIDDIR?=			${VARBASE}/run

OWN_DIRS+=		${ZBXHOME} ${ZBXLOGDIR}
OWN_DIRS_PERMS+=	${ZBXHOME} ${ZBXUSER} ${ZBXGROUP} 0770
OWN_DIRS_PERMS+=	${ZBXLOGDIR} ${ZBXUSER} ${ZBXGROUP} 0770

FILES_SUBST+=		ZBXUSER=${ZBXUSER}
FILES_SUBST+=		ZBXGROUP=${ZBXGROUP}
FILES_SUBST+=		ZBXHOME=${ZBXHOME}
BUILD_DEFS+=		VARBASE ZBXUSER ZBXGROUP ZBXHOME

PKG_GROUPS=		${ZBXGROUP}
PKG_USERS=		${ZBXUSER}:${ZBXGROUP}
PKG_HOME.${ZBXUSER}=	${ZBXHOME}
PKG_UID.${ZBXUSER}=	${ZBXUID}
PKG_GID.${ZBXGROUP}=	${ZBXGID}
PKG_GECOS.${ZBXUSER}=	Zabbix monitoring pseudo-user

#CFG="$(DESTDIR)/${PREFIX}/etc/zabbix/zabbix_proxy.conf"
CFG="$(DESTDIR)/${PREFIX}/share/examples/zabbix/zabbix_proxy.conf"

post-install:
	rm -f "$(DESTDIR)/${PREFIX}/etc/zabbix/zabbix_proxy.conf"
	cp -rp "$(WRKSRC)/conf/zabbix_proxy.conf" "$(DESTDIR)/${PREFIX}/share/examples/zabbix"

	sed 's;^Hostname=.*$$;#Hostname=;'				"$(CFG)" > "$(CFG).tmp"
	mv -f "$(CFG).tmp" "$(CFG)"
	sed 's;^LogFile=.*$$;LogFile=$(ZBXLOGDIR)/zabbix_proxy.log;'	"$(CFG)" > "$(CFG).tmp"
	mv -f "$(CFG).tmp" "$(CFG)"
	sed 's;^DBName=.*$$;DBName=$(ZBXHOME)/zabbix_proxy.db;'		"$(CFG)" > "$(CFG).tmp"
	mv -f "$(CFG).tmp" "$(CFG)"

	cd ${WRKSRC}/database/${ZABBIX_DB_TYPE}; \
		${PAX} -rw . ${DESTDIR}${PREFIX}/share/zabbix/
		rm ${DESTDIR}${PREFIX}/share/zabbix/Makefile*


.include "options.mk"

.include "../../converters/libiconv/buildlink3.mk"
#.include "../../databases/openldap-client/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
#.include "../../textproc/iksemel/buildlink3.mk"
#.include "../../textproc/libxml2/buildlink3.mk"
#.include "../../www/curl/buildlink3.mk"
.include "../../devel/pcre/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
#.include "../../archivers/brotli/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
