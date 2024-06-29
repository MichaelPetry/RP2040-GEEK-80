/*
 * Z80SIM  -  a Z80-CPU simulator
 *
 * Copyright (C) 2024 by Udo Munk & Thomas Eberhardt
 *
 * This module configures the machine appropriate for the
 * Z80/8080 software we want to run on it.
 *
 * History:
 * 20-APR-2024 dummy, no configuration implemented yet
 * 12-MAY-2024 implemented configuration dialog
 * 27-MAY-2024 implemented load file
 * 28-MAY-2024 implemented mount/unmount of disk images
 * 03-JUN-2024 added directory list for code files and disk images
 */

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "hardware/rtc.h"
#include "pico/stdlib.h"
#include "f_util.h"
#include "ff.h"
#include "sim.h"
#include "simglb.h"
#include "disks.h"
#include "lcd.h"

extern FIL sd_file;
extern FRESULT sd_res;
extern char disks[NUMDISK][DISKLEN];
extern int speed;
extern BYTE fp_value;
#if LIB_STDIO_MSC_USB
extern int msc_ejected;
#endif

extern int get_cmdline(char *, int);
extern void switch_cpu(int);
extern void init_disks(void), exit_disks(void);
extern void list_files(const char *, const char *);
extern void load_file(const char *);
extern void check_disks(void);
extern void mount_disk(int, const char *);

/*
 * prompt for a filename
 */
static void prompt_fn(char *s)
{
	printf("Filename: ");
	get_cmdline(s, 9);
	while (*s) {
		*s = toupper((unsigned char) *s);
		s++;
	}
}

/*
 * get an integer with range check
 */
static int get_int(char *prompt, int min_val, int max_val)
{
	int i;
	char s[7];

	for (;;) {
		printf("Enter %s: ", prompt);
		get_cmdline(s, 6);
		if (s[0] == '\0')
			return -1;
		i = atoi(s);
		if (i < min_val || i > max_val) {
			printf("Invalid %s: range %d - %d\n",
			       prompt, min_val, max_val);
		} else
			return i;
	}
}

/*
 * Configuration dialog for the machine
 */
void config(void)
{
	const char *cfg = "/CONF80/CFG.DAT";
	const char *cpath = "/CODE80";
	const char *cext = "*.BIN";
	const char *dpath = "/DISKS80";
	const char *dext = "*.DSK";
	char s[10];
	unsigned int br;
	int go_flag = 0, brightness = 90, rotated = 0;
	int i, n;
	datetime_t t;
	static const char *dotw[7] = { "Sun", "Mon", "Tue", "Wed",
				       "Thu", "Fri", "Sat" };

	/* try to read config file */
	sd_res = f_open(&sd_file, cfg, FA_READ);
	if (sd_res == FR_OK) {
		f_read(&sd_file, &cpu, sizeof(cpu), &br);
		f_read(&sd_file, &speed, sizeof(speed), &br);
		f_read(&sd_file, &fp_value, sizeof(fp_value), &br);
		f_read(&sd_file, &brightness, sizeof(brightness), &br);
		f_read(&sd_file, &rotated, sizeof(rotated), &br);
		f_read(&sd_file, &t, sizeof(datetime_t), &br);
		f_read(&sd_file, &disks[0], DISKLEN, &br);
		f_read(&sd_file, &disks[1], DISKLEN, &br);
		f_read(&sd_file, &disks[2], DISKLEN, &br);
		f_read(&sd_file, &disks[3], DISKLEN, &br);
		f_close(&sd_file);
	}
	lcd_brightness(brightness);
	lcd_set_rotated(rotated);
	rtc_set_datetime(&t);
	sleep_us(64);

	while (!go_flag) {
		if (rtc_get_datetime(&t)) {
			printf("Current time: %s %04d-%02d-%02d "
			       "%02d:%02d:%02d\n", dotw[t.dotw],
			       t.year, t.month, t.day, t.hour, t.min, t.sec);
		}
		printf("b - LCD brightness: %d\n", brightness);
		printf("m - rotate LCD\n");
		printf("a - set date\n");
		printf("t - set time\n");
#if LIB_STDIO_MSC_USB
		printf("u - enable USB mass storage access\n");
#endif
		printf("c - switch CPU, currently %s\n",
		       (cpu == Z80) ? "Z80" : "8080");
		printf("s - CPU speed: %d MHz\n", speed);
		printf("p - Port 255 value: %02XH\n", fp_value);
		printf("f - list files\n");
		printf("r - load file\n");
		printf("d - list disks\n");
		printf("0 - Disk 0: %s\n", disks[0]);
		printf("1 - Disk 1: %s\n", disks[1]);
		printf("2 - Disk 2: %s\n", disks[2]);
		printf("3 - Disk 3: %s\n", disks[3]);
		printf("g - run machine\n\n");
		printf("Command: ");
		get_cmdline(s, 2);
		putchar('\n');

		switch (tolower((unsigned char) s[0])) {
		case 'b':
			if ((i = get_int("brightness", 0, 100)) >= 0) {
				brightness = i;
				lcd_brightness((uint8_t) brightness);
			}
			putchar('\n');
			break;

		case 'm':
			rotated = !rotated;
			lcd_set_rotated(rotated);
			break;

		case 'a':
			n = 0;
			if ((i = get_int("weekday", 0, 6)) >= 0) {
				t.dotw = i;
				n++;
			}
			if ((i = get_int("year", 0, 4095)) >= 0) {
				t.year = i;
				n++;
			}
			if ((i = get_int("month", 1, 12)) >= 0) {
				t.month = i;
				n++;
			}
			if ((i = get_int("day", 1, 31)) >= 0) {
				t.day = i;
				n++;
			}
			if (n > 0) {
				rtc_set_datetime(&t);
				sleep_us(64);
			}
			putchar('\n');
			break;

		case 't':
			n = 0;
			if ((i = get_int("hour", 0, 23)) >= 0) {
				t.hour = i;
				n++;
			}
			if ((i = get_int("minute", 0, 59)) >= 0) {
				t.min = i;
				n++;
			}
			if ((i = get_int("second", 0, 59)) >= 0) {
				t.sec = i;
				n++;
			}
			if (n > 0) {
				rtc_set_datetime(&t);
				sleep_us(64);
			}
			putchar('\n');
			break;

#if LIB_STDIO_MSC_USB
		case 'u':
			exit_disks();
			puts("Waiting for disk to be ejected");
			msc_ejected = false;
			while (!msc_ejected)
				sleep_ms(500);
			puts("Disk ejected\n");
			init_disks();
			check_disks();
			break;
#endif

		case 'c':
			if (cpu == Z80)
				switch_cpu(I8080);
			else
				switch_cpu(Z80);
			break;

		case 's':
			printf("Value in MHz, 0=unlimited: ");
			get_cmdline(s, 2);
			putchar('\n');
			if (s[0])
				speed = atoi((const char *) &s);
			break;

		case 'p':
again:
			printf("Value in Hex: ");
			get_cmdline(s, 3);
			putchar('\n');
			if (s[0]) {
				if (!isxdigit((unsigned char) s[0]) ||
				    !isxdigit((unsigned char) s[1])) {
					puts("What?");
					goto again;
				}
				fp_value = (s[0] <= '9' ? s[0] - '0' :
					    toupper((unsigned char) s[0]) -
					    'A' + 10) << 4;
				fp_value += (s[1] <= '9' ? s[1] - '0' :
					     toupper((unsigned char) s[1]) -
					     'A' + 10);
			}
			break;

		case 'f':
			list_files(cpath, cext);
			putchar('\n');
			break;

		case 'r':
			prompt_fn(s);
			if (s[0])
				load_file(s);
			putchar('\n');
			break;

		case 'd':
			list_files(dpath, dext);
			putchar('\n');
			break;

		case '0':
		case '1':
		case '2':
		case '3':
			i = s[0] - '0';
			prompt_fn(s);
			if (s[0])
				mount_disk(i, s);
			else {
				disks[i][0] = '\0';
				putchar('\n');
			}
			break;

		case 'g':
			go_flag = 1;
			break;

		default:
			break;
		}
	}

	/* try to save config file */
	sd_res = f_open(&sd_file, cfg, FA_WRITE | FA_CREATE_ALWAYS);
	if (sd_res == FR_OK) {
		f_write(&sd_file, &cpu, sizeof(cpu), &br);
		f_write(&sd_file, &speed, sizeof(speed), &br);
		f_write(&sd_file, &fp_value, sizeof(fp_value), &br);
		f_write(&sd_file, &brightness, sizeof(brightness), &br);
		f_write(&sd_file, &rotated, sizeof(rotated), &br);
		f_write(&sd_file, &t, sizeof(datetime_t), &br);
		f_write(&sd_file, &disks[0], DISKLEN, &br);
		f_write(&sd_file, &disks[1], DISKLEN, &br);
		f_write(&sd_file, &disks[2], DISKLEN, &br);
		f_write(&sd_file, &disks[3], DISKLEN, &br);
		f_close(&sd_file);
	}
}
