# $NetBSD: Makefile,v 1.61 2018/11/14 22:22:45 kleink Exp $

PKGREVISION= 10
.include "../../meta-pkgs/xfce4/Makefile.common"

VERSION=	4.10.0
DISTNAME=	libxfcegui4-${VERSION}
PKGNAME=	libxfce4gui-${VERSION}
CATEGORIES=	x11
MASTER_SITES=	http://archive.xfce.org/src/archive/libxfcegui4/4.10/

COMMENT=	Xfce widget library

PKGCONFIG_OVERRIDE=	libxfcegui4/libxfcegui4-1.0.pc.in

HOMEPAGE=	http://archive.xfce.org/src/archive/libxfcegui4/4.10/
COMMENT=	Xfce widget library

.include "../../devel/libglade/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../x11/libxfce4util/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
