# $NetBSD: Makefile,v 1.5 2019/01/26 11:47:12 markd Exp $

DISTNAME=	pdfcomment
PKGNAME=	tex-${DISTNAME}-2.4a
TEXLIVE_REV=	49047

MAINTAINER=	minskim@NetBSD.org
HOMEPAGE=	http://ctan.org/pkg/pdfcomment
COMMENT=	User-friendly interface to pdf annotations
LICENSE=	lppl-1.3c

DEPENDS+=	tex-datetime-[0-9]*:../../print/tex-datetime
DEPENDS+=	tex-hyperref>=6.81p:../../print/tex-hyperref
DEPENDS+=	tex-latex-[0-9]*:../../print/tex-latex
DEPENDS+=	tex-marginnote-[0-9]*:../../print/tex-marginnote
DEPENDS+=	tex-oberdiek-[0-9]*:../../print/tex-oberdiek
DEPENDS+=	tex-tools-[0-9]*:../../print/tex-tools
DEPENDS+=	tex-xkeyval-[0-9]*:../../print/tex-xkeyval

.include "../../print/texlive/package.mk"
.include "../../mk/bsd.pkg.mk"
