# $NetBSD: Makefile,v 1.2 2019/03/05 10:45:38 nia Exp $

DISTNAME=	easyrpg-player-0.6.0
CATEGORIES=	games
MASTER_SITES=	https://easyrpg.org/downloads/player/

MAINTAINER=	nia@NetBSD.org
HOMEPAGE=	https://easyrpg.org/
COMMENT=	RPG Maker 2000/2003 and EasyRPG games interpreter
LICENSE=	gnu-gpl-v3

HAS_CONFIGURE=	yes
GNU_CONFIGURE=	yes
USE_TOOLS+=	pkg-config gmake
USE_LANGUAGES+=	c c++

.include "options.mk"
.include "../../audio/libxmp/buildlink3.mk"
.include "../../audio/SDL2_mixer/buildlink3.mk"
.include "../../devel/SDL2/buildlink3.mk"
.include "../../games/liblcf/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../x11/pixman/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
