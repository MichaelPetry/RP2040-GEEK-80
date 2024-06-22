#ifndef __GUI_PAINT_H
#define __GUI_PAINT_H

#include <stdint.h>
#include "../Fonts/fonts.h"

/*
 *	Image attributes
*/
typedef struct {
	uint8_t *Image;
	uint16_t Width;
	uint16_t Height;
	uint16_t WidthMemory;
	uint16_t HeightMemory;
	uint16_t Color;
	uint16_t Rotate;
	uint16_t Mirror;
	uint16_t WidthByte;
	uint16_t HeightByte;
	uint16_t Depth;
} PAINT;
extern PAINT Paint;

/*
 *	Display rotate
 */
#define ROTATE_0	0
#define ROTATE_90	90
#define ROTATE_180	180
#define ROTATE_270	270

/*
 *	Display flip
*/
typedef enum {
	MIRROR_NONE  = 0x00,
	MIRROR_HORIZONTAL = 0x01,
	MIRROR_VERTICAL = 0x02,
	MIRROR_ORIGIN = 0x03
} MIRROR_IMAGE;
#define MIRROR_IMAGE_DFT MIRROR_NONE

/*
 *	Image colors (444 (12-bit) or 565 (16-bit))
 */
#if LCD_COLOR_DEPTH == 12
#define BLUE		0x000f
#define BRED		0x0f0f
#define GRED		0x0ff0
#define GBLUE		0x00ff
#define RED		0x0f00
#define MAGENTA		0x0f0f
#define GREEN		0x00f0
#define CYAN		0x00ff
#define YELLOW		0x0ff0
#define BROWN		0x0c90
#define BRRED		0x0f84
#define GRAY		0x0888
#else
#define BLUE		0x001f
#define BRED		0xf81f
#define GRED		0xffe0
#define GBLUE		0x07ff
#define RED		0xf800
#define MAGENTA		0xf81f
#define GREEN		0x07e0
#define CYAN		0x7fff
#define YELLOW		0xffe0
#define BROWN		0xbc40
#define BRRED		0xfc07
#define GRAY		0x8430
#endif

/*
 *	Define WHITE and BLACK as all ones or zeroes,
 *	so they're usable with all color depths
 */
#define WHITE		0xffff
#define BLACK		0x0000

#define IMAGE_BACKGROUND WHITE
#define FONT_FOREGROUND	BLACK
#define FONT_BACKGROUND	WHITE

/**
 * The size of the point
**/
typedef enum {
	DOT_PIXEL_1X1 = 1,	/* 1 x 1 */
	DOT_PIXEL_2X2,		/* 2 x 2 */
	DOT_PIXEL_3X3,		/* 3 x 3 */
	DOT_PIXEL_4X4,		/* 4 x 4 */
	DOT_PIXEL_5X5, 		/* 5 x 5 */
	DOT_PIXEL_6X6, 		/* 6 x 6 */
	DOT_PIXEL_7X7, 		/* 7 x 7 */
	DOT_PIXEL_8X8 		/* 8 x 8 */
} DOT_PIXEL;
#define DOT_PIXEL_DFT DOT_PIXEL_1X1 /* Default dot pixel */

/*
 *	Point size fill style
 */
typedef enum {
	DOT_FILL_AROUND = 1,	/* dot pixel 1 x 1 */
	DOT_FILL_RIGHTUP	/* dot pixel 2 x 2 */
} DOT_STYLE;
#define DOT_STYLE_DFT DOT_FILL_AROUND /* Default dot pixel */

/*
 *	Line style, solid or dashed
 */
typedef enum {
	LINE_STYLE_SOLID = 0,
	LINE_STYLE_DOTTED
} LINE_STYLE;

/*
 *	Whether the graphic is filled
*/
typedef enum {
	DRAW_FILL_EMPTY = 0,
	DRAW_FILL_FULL
} DRAW_FILL;

/*
 *	Custom structure of a time attribute
 */
typedef struct {
	uint16_t Year;	/* 0000 */
	uint8_t Month;	/* 1 - 12 */
	uint8_t Day;	/* 1 - 30 */
	uint8_t Hour;	/* 0 - 23 */
	uint8_t Min;	/* 0 - 59 */
	uint8_t Sec;	/* 0 - 59 */
} PAINT_TIME;
extern PAINT_TIME sPaint_time;

/* Init and clear */
void Paint_NewImage(uint8_t *image, uint16_t Width, uint16_t Height,
		    uint16_t Rotate, uint16_t Color);
void Paint_SelectImage(uint8_t *image);
void Paint_SetRotate(uint16_t Rotate);
void Paint_SetMirroring(uint8_t mirror);
void Paint_SetPixel(uint16_t Xpoint, uint16_t Ypoint, uint16_t Color);
void Paint_SetDepth(uint8_t depth);

void Paint_Clear(uint16_t Color);
void Paint_ClearWindows(uint16_t Xstart, uint16_t Ystart,
			uint16_t Xend, uint16_t Yend, uint16_t Color);

/* Drawing */
void Paint_DrawPoint(uint16_t Xpoint, uint16_t Ypoint, uint16_t Color,
		     DOT_PIXEL Dot_Pixel, DOT_STYLE Dot_FillWay);
void Paint_DrawLine(uint16_t Xstart, uint16_t Ystart,
		    uint16_t Xend, uint16_t Yend,
		    uint16_t Color, DOT_PIXEL Line_width,
		    LINE_STYLE Line_Style);
void Paint_DrawRectangle(uint16_t Xstart, uint16_t Ystart,
			 uint16_t Xend, uint16_t Yend,
			 uint16_t Color, DOT_PIXEL Line_width,
			 DRAW_FILL Draw_Fill);
void Paint_DrawCircle(uint16_t X_Center, uint16_t Y_Center, uint16_t Radius,
		      uint16_t Color, DOT_PIXEL Line_width,
		      DRAW_FILL Draw_Fill);

/* Display string */
void Paint_DrawChar(uint16_t Xstart, uint16_t Ystart, const char Acsii_Char,
		    sFONT *Font, uint16_t Color_Foreground,
		    uint16_t Color_Background);
void Paint_DrawString(uint16_t Xstart, uint16_t Ystart, const char *pString,
		      sFONT *Font, uint16_t Color_Foreground,
		      uint16_t Color_Background);
void Paint_DrawNum(uint16_t Xpoint, uint16_t Ypoint, double Nummber,
		   sFONT *Font, uint16_t Digit, uint16_t Color_Foreground,
		   uint16_t Color_Background);
void Paint_DrawTime(uint16_t Xstart, uint16_t Ystart, PAINT_TIME *pTime,
		    sFONT *Font, uint16_t Color_Foreground,
		    uint16_t Color_Background);

/* Pic */
void Paint_DrawBitMap(const unsigned char *image_buffer);
void Paint_DrawBitMap_Block(const unsigned char *image_buffer, uint8_t Region);

void Paint_DrawImage(const unsigned char *image,
		     uint16_t xStart, uint16_t yStart,
		     uint16_t W_Image, uint16_t H_Image) ;
void Paint_DrawImage1(const unsigned char *image,
		      uint16_t xStart, uint16_t yStart,
		      uint16_t W_Image, uint16_t H_Image);
void Paint_BmpWindows(unsigned char x, unsigned char y,
		      const unsigned char *pBmp,
		      unsigned char chWidth, unsigned char chHeight);

#endif
