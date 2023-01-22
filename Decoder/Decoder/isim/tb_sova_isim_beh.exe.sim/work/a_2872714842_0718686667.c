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
static const char *ng0 = "D:/PhD/Semester/Term 1/VHDL/Project/Turbo Code/Decoder/Decoder/delayer.vhd";
extern char *IEEE_P_3499444699;



static void work_a_2872714842_0718686667_p_0(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    int t11;
    int t12;
    int t13;
    int t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned char t22;
    unsigned char t23;
    int t24;
    int t25;
    int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;

LAB0:    xsi_set_current_line(23, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t22 = (t4 == (unsigned char)3);
    if (t22 == 1)
        goto LAB12;

LAB13:    t3 = (unsigned char)0;

LAB14:    if (t3 != 0)
        goto LAB10;

LAB11:
LAB3:    t1 = (t0 + 3272);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(24, ng0);
    t1 = ieee_std_logic_arith_conv_unsigned_integer(IEEE_P_3499444699, t5, 0, 5);
    t6 = (t0 + 3352);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 5U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(25, ng0);
    t11 = (36 - 1);
    t1 = (t0 + 6047);
    *((int *)t1) = 0;
    t2 = (t0 + 6051);
    *((int *)t2) = t11;
    t12 = 0;
    t13 = t11;

LAB5:    if (t12 <= t13)
        goto LAB6;

LAB8:    goto LAB3;

LAB6:    xsi_set_current_line(26, ng0);
    t6 = xsi_get_transient_memory(5U);
    memset(t6, 0, 5U);
    t7 = t6;
    memset(t7, (unsigned char)2, 5U);
    t8 = (t0 + 6047);
    t14 = *((int *)t8);
    t15 = (t14 - 0);
    t16 = (t15 * 1);
    t17 = (5U * t16);
    t18 = (0U + t17);
    t9 = (t0 + 3416);
    t10 = (t9 + 56U);
    t19 = *((char **)t10);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t6, 5U);
    xsi_driver_first_trans_delta(t9, t18, 5U, 0LL);

LAB7:    t1 = (t0 + 6047);
    t12 = *((int *)t1);
    t2 = (t0 + 6051);
    t13 = *((int *)t2);
    if (t12 == t13)
        goto LAB8;

LAB9:    t11 = (t12 + 1);
    t12 = t11;
    t6 = (t0 + 6047);
    *((int *)t6) = t12;
    goto LAB5;

LAB10:    xsi_set_current_line(29, ng0);
    t6 = (t0 + 1352U);
    t7 = *((char **)t6);
    t6 = (t0 + 3416);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t19 = *((char **)t10);
    memcpy(t19, t7, 5U);
    xsi_driver_first_trans_delta(t6, 0U, 5U, 0LL);
    xsi_set_current_line(30, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t11 = (36 - 1);
    t12 = (t11 - 0);
    t16 = (t12 * 1);
    t17 = (5U * t16);
    t18 = (0 + t17);
    t1 = (t2 + t18);
    t6 = (t0 + 3352);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 5U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(31, ng0);
    t11 = (36 - 2);
    t1 = (t0 + 6055);
    *((int *)t1) = 0;
    t2 = (t0 + 6059);
    *((int *)t2) = t11;
    t12 = 0;
    t13 = t11;

LAB15:    if (t12 <= t13)
        goto LAB16;

LAB18:    goto LAB3;

LAB12:    t1 = (t0 + 992U);
    t23 = xsi_signal_has_event(t1);
    t3 = t23;
    goto LAB14;

LAB16:    xsi_set_current_line(32, ng0);
    t6 = (t0 + 1672U);
    t7 = *((char **)t6);
    t6 = (t0 + 6055);
    t14 = *((int *)t6);
    t15 = (t14 - 0);
    t16 = (t15 * 1);
    xsi_vhdl_check_range_of_index(0, 35, 1, *((int *)t6));
    t17 = (5U * t16);
    t18 = (0 + t17);
    t8 = (t7 + t18);
    t9 = (t0 + 6055);
    t24 = *((int *)t9);
    t25 = (t24 + 1);
    t26 = (t25 - 0);
    t27 = (t26 * 1);
    t28 = (5U * t27);
    t29 = (0U + t28);
    t10 = (t0 + 3416);
    t19 = (t10 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t30 = *((char **)t21);
    memcpy(t30, t8, 5U);
    xsi_driver_first_trans_delta(t10, t29, 5U, 0LL);

LAB17:    t1 = (t0 + 6055);
    t12 = *((int *)t1);
    t2 = (t0 + 6059);
    t13 = *((int *)t2);
    if (t12 == t13)
        goto LAB18;

LAB19:    t11 = (t12 + 1);
    t12 = t11;
    t6 = (t0 + 6055);
    *((int *)t6) = t12;
    goto LAB15;

}


extern void work_a_2872714842_0718686667_init()
{
	static char *pe[] = {(void *)work_a_2872714842_0718686667_p_0};
	xsi_register_didat("work_a_2872714842_0718686667", "isim/tb_sova_isim_beh.exe.sim/work/a_2872714842_0718686667.didat");
	xsi_register_executes(pe);
}
