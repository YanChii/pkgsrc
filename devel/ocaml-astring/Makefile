# $NetBSD: Makefile,v 1.1 2019/03/12 18:04:58 jaapb Exp $

DISTNAME=	astring-0.8.3
PKGNAME=	ocaml-${DISTNAME}
CATEGORIES=	devel
MASTER_SITES=	https://erratique.ch/software/astring/releases/
EXTRACT_SUFX=	.tbz

MAINTAINER=	jaapb@NetBSD.org
HOMEPAGE=	https://erratique.ch/software/astring/
COMMENT=	Alternative string library for OCaml
LICENSE=	isc

USE_LANGUAGES=	# none

OCAML_USE_TOPKG=	yes
OCAML_USE_OPAM=	yes

.include "../../devel/ocamlbuild/buildlink3.mk"
.include "../../mk/ocaml.mk"
.include "../../mk/bsd.pkg.mk"
