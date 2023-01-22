/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/PhD/Semester/Term 1/VHDL/Project/Turbo Code/Encoder/mux8t1.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3545560974_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    int t11;

LAB0:    xsi_set_current_line(21, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(24, ng0);
    t1 = (t0 + 1152U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB7:
LAB6:
LAB3:    t1 = (t0 + 3400);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(22, ng0);
    t1 = (t0 + 3496);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 8;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1672U);
    t5 = *((char **)t2);
    t9 = *((int *)t5);
    t4 = (t9 == 1);
    if (t4 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t11 = (t9 - 1);
    t1 = (t0 + 3496);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t11;
    xsi_driver_first_trans_fast(t1);

LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 3496);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    *((int *)t10) = 8;
    xsi_driver_first_trans_fast(t2);
    goto LAB9;

}

static void work_a_3545560974_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    t1 = (t0 + 3080U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    if (t4 == 1)
        goto LAB5;

LAB14:    if (t4 == 2)
        goto LAB6;

LAB15:    if (t4 == 3)
        goto LAB7;

LAB16:    if (t4 == 4)
        goto LAB8;

LAB17:    if (t4 == 5)
        goto LAB9;

LAB18:    if (t4 == 6)
        goto LAB10;

LAB19:    if (t4 == 7)
        goto LAB11;

LAB20:    if (t4 == 8)
        goto LAB12;

LAB21:
LAB13:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 3560);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);

LAB4:    xsi_set_current_line(39, ng0);

LAB25:    t2 = (t0 + 3416);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB26;

LAB1:    return;
LAB5:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t6 = (0 - 7);
    t7 = (t6 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t2 = (t5 + t9);
    t10 = *((unsigned char *)t2);
    t11 = (t0 + 3560);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t10;
    xsi_driver_first_trans_fast_port(t11);
    goto LAB4;

LAB6:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = (1 - 7);
    t7 = (t4 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t2 = (t3 + t9);
    t10 = *((unsigned char *)t2);
    t5 = (t0 + 3560);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t10;
    xsi_driver_first_trans_fast_port(t5);
    goto LAB4;

LAB7:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = (2 - 7);
    t7 = (t4 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t2 = (t3 + t9);
    t10 = *((unsigned char *)t2);
    t5 = (t0 + 3560);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t10;
    xsi_driver_first_trans_fast_port(t5);
    goto LAB4;

LAB8:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = (3 - 7);
    t7 = (t4 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t2 = (t3 + t9);
    t10 = *((unsigned char *)t2);
    t5 = (t0 + 3560);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t10;
    xsi_driver_first_trans_fast_port(t5);
    goto LAB4;

LAB9:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = (4 - 7);
    t7 = (t4 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t2 = (t3 + t9);
    t10 = *((unsigned char *)t2);
    t5 = (t0 + 3560);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t10;
    xsi_driver_first_trans_fast_port(t5);
    goto LAB4;

LAB10:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = (5 - 7);
    t7 = (t4 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t2 = (t3 + t9);
    t10 = *((unsigned char *)t2);
    t5 = (t0 + 3560);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t10;
    xsi_driver_first_trans_fast_port(t5);
    goto LAB4;

LAB11:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = (6 - 7);
    t7 = (t4 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t2 = (t3 + t9);
    t10 = *((unsigned char *)t2);
    t5 = (t0 + 3560);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t10;
    xsi_driver_first_trans_fast_port(t5);
    goto LAB4;

LAB12:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = (7 - 7);
    t7 = (t4 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t2 = (t3 + t9);
    t10 = *((unsigned char *)t2);
    t5 = (t0 + 3560);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t10;
    xsi_driver_first_trans_fast_port(t5);
    goto LAB4;

LAB22:;
LAB23:    t3 = (t0 + 3416);
    *((int *)t3) = 0;
    goto LAB2;

LAB24:    goto LAB23;

LAB26:    goto LAB24;

}


extern void work_a_3545560974_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3545560974_3212880686_p_0,(void *)work_a_3545560974_3212880686_p_1};
	xsi_register_didat("work_a_3545560974_3212880686", "isim/tb_mux8t1_isim_beh.exe.sim/work/a_3545560974_3212880686.didat");
	xsi_register_executes(pe);
}
