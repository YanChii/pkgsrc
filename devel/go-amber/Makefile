# $NetBSD: Makefile,v 1.12 2019/03/16 08:35:43 bsiegert Exp $

DISTNAME=	amber-0.0.20171010
PKGNAME=	go-${DISTNAME}
PKGREVISION=	4
MASTER_SITES=	${MASTER_SITE_GITHUB:=eknkc/}
CATEGORIES=	devel
GITHUB_TAG=	cdade1c073850f4ffc70a829e31235ea6892853b
GITHUB_PROJECT= ${PKGBASE:S/^go-//}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/eknkc/amber
COMMENT=	Templating engine for Go inspired by HAML and Jade
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/eknkc/amber

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
