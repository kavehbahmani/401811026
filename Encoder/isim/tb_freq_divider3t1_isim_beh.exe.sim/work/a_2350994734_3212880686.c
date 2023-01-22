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
static const char *ng0 = "D:/PhD/Semester/Term 1/VHDL/Project/Turbo Code/Encoder/freq_divider3t1.vhd";



static void work_a_2350994734_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    int t15;

LAB0:    xsi_set_current_line(21, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB17;

LAB18:    t1 = (unsigned char)0;

LAB19:    if (t1 != 0)
        goto LAB14;

LAB16:
LAB15:    t2 = (t0 + 3400);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(23, ng0);
    t4 = (t0 + 1352U);
    t8 = *((char **)t4);
    t9 = *((int *)t8);
    t10 = (t9 == 1);
    if (t10 != 0)
        goto LAB8;

LAB10:
LAB9:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t9 = *((int *)t4);
    t1 = (t9 == 3);
    if (t1 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t9 = *((int *)t4);
    t15 = (t9 + 1);
    t2 = (t0 + 3560);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((int *)t12) = t15;
    xsi_driver_first_trans_fast(t2);

LAB12:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(24, ng0);
    t4 = (t0 + 3496);
    t11 = (t4 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast(t4);
    goto LAB9;

LAB11:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 3560);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((int *)t12) = 1;
    xsi_driver_first_trans_fast(t2);
    goto LAB12;

LAB14:    xsi_set_current_line(37, ng0);
    t4 = (t0 + 1512U);
    t8 = *((char **)t4);
    t9 = *((int *)t8);
    t10 = (t9 == 2);
    if (t10 != 0)
        goto LAB20;

LAB22:
LAB21:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t9 = *((int *)t4);
    t1 = (t9 == 3);
    if (t1 != 0)
        goto LAB23;

LAB25:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t9 = *((int *)t4);
    t15 = (t9 + 1);
    t2 = (t0 + 3624);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((int *)t12) = t15;
    xsi_driver_first_trans_fast(t2);

LAB24:    goto LAB15;

LAB17:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t1 = t7;
    goto LAB19;

LAB20:    xsi_set_current_line(38, ng0);
    t4 = (t0 + 3496);
    t11 = (t4 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_fast(t4);
    goto LAB21;

LAB23:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 3624);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((int *)t12) = 1;
    xsi_driver_first_trans_fast(t2);
    goto LAB24;

}

static void work_a_2350994734_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(52, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 3688);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 3416);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2350994734_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2350994734_3212880686_p_0,(void *)work_a_2350994734_3212880686_p_1};
	xsi_register_didat("work_a_2350994734_3212880686", "isim/tb_freq_divider3t1_isim_beh.exe.sim/work/a_2350994734_3212880686.didat");
	xsi_register_executes(pe);
}
