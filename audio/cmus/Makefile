# $NetBSD: Makefile,v 1.75 2019/02/11 10:07:37 nia Exp $

DISTNAME=		cmus-2.8.0
CATEGORIES=		audio
MASTER_SITES=		${MASTER_SITE_GITHUB:=cmus/}
GITHUB_TAG=		v${PKGVERSION_NOREV}

MAINTAINER=		ahoka@NetBSD.org
HOMEPAGE=		https://cmus.github.io/
COMMENT=		Small, fast and powerful text mode music player
LICENSE=		gnu-gpl-v2

EXTRACT_USING=		bsdtar
HAS_CONFIGURE=		yes
USE_TOOLS+=		gmake pkg-config

REPLACE_SH+=		cmus-status-display

CONFIGURE_ARGS+=	prefix=${PREFIX}
CONFIGURE_ARGS+=	CONFIG_ALSA=n
CONFIGURE_ARGS+=	mandir=${PREFIX}/${PKGMANDIR}
PLIST_VARS+=		sunaudio oss

.include "../../mk/oss.buildlink3.mk"
.if ${OSS_TYPE} != "none"
PLIST.oss=	yes
CONFIGURE_ARGS+=	CONFIG_OSS=y
.else
CONFIGURE_ARGS+=	CONFIG_OSS=n
.endif

.include "../../mk/bsd.prefs.mk"
.if ${OPSYS} == "SunOS" || exists(/usr/include/sys/audioio.h)
CONFIGURE_ARGS+=	CONFIG_SUN=y
PLIST.sunaudio=		yes
.else
CONFIGURE_ARGS+=	CONFIG_SUN=n
.endif

NOT_PAX_MPROTECT_SAFE+=	bin/cmus

.include "options.mk"

.include "../../mk/dlopen.buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/ncursesw/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
