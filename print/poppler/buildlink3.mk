# $NetBSD: buildlink3.mk,v 1.72 2019/03/27 11:18:38 wiz Exp $

BUILDLINK_TREE+=	poppler

.if !defined(POPPLER_BUILDLINK3_MK)
POPPLER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.poppler+=	poppler>=0.5.1
BUILDLINK_ABI_DEPENDS.poppler+=	poppler>=0.74.0
BUILDLINK_PKGSRCDIR.poppler?=	../../print/poppler

GCC_REQD+=	4.9

.include "../../graphics/lcms2/buildlink3.mk"
.include "../../fonts/fontconfig/buildlink3.mk"
.include "../../mk/jpeg.buildlink3.mk"
.include "../../graphics/openjpeg/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.endif # POPPLER_BUILDLINK3_MK

BUILDLINK_TREE+=	-poppler
