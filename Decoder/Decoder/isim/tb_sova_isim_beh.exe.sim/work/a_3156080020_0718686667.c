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
static const char *ng0 = "D:/PhD/Semester/Term 1/VHDL/Project/Turbo Code/Decoder/Decoder/distance.vhd";
extern char *IEEE_P_3499444699;
extern char *WORK_P_1987032454;



static void work_a_3156080020_0718686667_p_0(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    int t4;
    int t5;
    int t6;
    int t7;
    int t8;
    char *t9;
    int t10;
    int t11;
    int t12;
    char *t13;
    char *t14;
    int t15;
    int t16;
    char *t17;
    char *t18;
    int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(16, ng0);

LAB3:    t2 = ((WORK_P_1987032454) + 1768U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t5 = (t4 - 1);
    t6 = xsi_vhdl_pow(2, t5);
    t7 = (t6 - 1);
    t8 = (4 * t7);
    t2 = (t0 + 1032U);
    t9 = *((char **)t2);
    t2 = (t0 + 4672U);
    t10 = ieee_std_logic_arith_conv_integer_signed(IEEE_P_3499444699, t9, t2);
    t11 = (t8 + t10);
    t12 = (t11 / 2);
    t13 = (t0 + 1192U);
    t14 = *((char **)t13);
    t13 = (t0 + 4688U);
    t15 = ieee_std_logic_arith_conv_integer_unsigned(IEEE_P_3499444699, t14, t13);
    t16 = (t12 + t15);
    t17 = ((WORK_P_1987032454) + 2008U);
    t18 = *((char **)t17);
    t19 = *((int *)t18);
    t17 = ieee_std_logic_arith_conv_unsigned_integer(IEEE_P_3499444699, t1, t16, t19);
    t20 = (t0 + 2912);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t17, 9U);
    xsi_driver_first_trans_fast_port(t20);

LAB2:    t25 = (t0 + 2832);
    *((int *)t25) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3156080020_0718686667_init()
{
	static char *pe[] = {(void *)work_a_3156080020_0718686667_p_0};
	xsi_register_didat("work_a_3156080020_0718686667", "isim/tb_sova_isim_beh.exe.sim/work/a_3156080020_0718686667.didat");
	xsi_register_executes(pe);
}
