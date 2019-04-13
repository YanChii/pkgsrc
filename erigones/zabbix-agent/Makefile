# $NetBSD: Makefile,v 1.11 2018/04/29 21:32:05 adam Exp $

# PKGREVISION= 3
PKGREVISION= 1
.include "Makefile.common"

COMMENT=	Enterprise-class Monitoring Solution for Everyone

#DEPENDS+=	fping-[0-9]*:../../net/fping

USE_TOOLS+=		pax pkg-config
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--enable-agent
#CONFIGURE_ARGS+=	--enable-proxy
CONFIGURE_ARGS+=	--disable-server
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--with-iconv=${BUILDLINK_PREFIX.iconv}
#CONFIGURE_ARGS+=	--with-jabber
#CONFIGURE_ARGS+=	--with-ldap=${BUILDLINK_PREFIX.openldap-client}
#CONFIGURE_ARGS+=	--with-libcurl=${BUILDLINK_PREFIX.curl}/bin/curl-config
#CONFIGURE_ARGS+=	--with-libxml2
CONFIGURE_ARGS+=	--with-openssl=${BUILDLINK_PREFIX.openssl}
CONFIGURE_ARGS+=	--with-libpcre=${BUILDLINK_PREFIX.pcre}

PKG_SYSCONFSUBDIR=zabbix
EGDIR=		share/examples/zabbix
CONF_FILES+=	${EGDIR}/zabbix_agentd.conf ${PKG_SYSCONFDIR}/zabbix_agentd.conf

RCD_SCRIPTS=	zabbix_agentd 

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

post-install:
	cp -rp "$(WRKSRC)/conf/zabbix_agentd.conf" "$(DESTDIR)/${PREFIX}/share/examples/zabbix"

	echo '' >> "$(DESTDIR)/${PREFIX}/share/examples/zabbix/zabbix_agentd.conf"
	echo 'UserParameter=smf.maintenance,/usr/bin/svcs -x | grep -c svc:/' >> "$(DESTDIR)/${PREFIX}/share/examples/zabbix/zabbix_agentd.conf"
	echo 'UserParameter=smf.status[*],/usr/bin/svcs -Ho state $$1 2>/dev/null || echo ZBX_NOTSUPPORTED' >> "$(DESTDIR)/${PREFIX}/share/examples/zabbix/zabbix_agentd.conf"
	rm -rf ${DESTDIR}${PREFIX}/share/zabbix

.include "options.mk"

.include "../../converters/libiconv/buildlink3.mk"
#.include "../../databases/openldap-client/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
#.include "../../textproc/iksemel/buildlink3.mk"
#.include "../../textproc/libxml2/buildlink3.mk"
#.include "../../www/curl/buildlink3.mk"
.include "../../devel/pcre/buildlink3.mk"
#.include "../../archivers/brotli/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
