# $NetBSD: Makefile,v 1.3 2019/01/02 19:46:10 bsiegert Exp $

DISTNAME=	sord-0.16.2
CATEGORIES=	textproc
MASTER_SITES=	http://download.drobilla.net/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://drobilla.net/software/sord/
COMMENT=	Lightweight C library for storing RDF data in memory
LICENSE=	isc

USE_LANGUAGES=	c c++
USE_TOOLS+=	gsed pkg-config

PKGCONFIG_OVERRIDE+=	sord.pc.in

.include "options.mk"

BUILD_OPTIONS=	${BUILD_DEBUG} ${BUILD_DOC} ${BUILD_TESTS} ${BUILD_VALGRIND}

do-configure:
	cd ${WRKSRC} && \
		${SETENV} ${CONFIGURE_ENV} ${PYTHONBIN} ./waf configure \
			--destdir=${DESTDIR} --mandir=${PREFIX}/${PKGMANDIR} \
				${BUILD_OPTIONS}
do-build:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${PYTHONBIN} ./waf build

do-install:
	cd ${WRKSRC} && ${SETENV} ${INSTALL_ENV} ${PYTHONBIN} ./waf install

.include "../../devel/pcre/buildlink3.mk"
BUILDLINK_API_DEPENDS.serd+=	serd>=0.30.0
.include "../../textproc/serd/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
