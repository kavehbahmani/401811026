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
static const char *ng0 = "D:/PhD/Semester/Term 1/VHDL/Project/Turbo Code/Decoder/Decoder/cmp2.vhd";
extern char *IEEE_P_3499444699;



static void work_a_3023658813_0718686667_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    char *t5;
    int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(15, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4620U);
    t3 = ieee_std_logic_arith_conv_integer_unsigned(IEEE_P_3499444699, t2, t1);
    t4 = (t0 + 1192U);
    t5 = *((char **)t4);
    t4 = (t0 + 4636U);
    t6 = ieee_std_logic_arith_conv_integer_unsigned(IEEE_P_3499444699, t5, t4);
    t7 = (t3 > t6);
    if (t7 != 0)
        goto LAB3;

LAB4:
LAB5:    t13 = (t0 + 2912);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t13);

LAB2:    t18 = (t0 + 2832);
    *((int *)t18) = 1;

LAB1:    return;
LAB3:    t8 = (t0 + 2912);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB6:    goto LAB2;

}


extern void work_a_3023658813_0718686667_init()
{
	static char *pe[] = {(void *)work_a_3023658813_0718686667_p_0};
	xsi_register_didat("work_a_3023658813_0718686667", "isim/tb_sova_isim_beh.exe.sim/work/a_3023658813_0718686667.didat");
	xsi_register_executes(pe);
}
