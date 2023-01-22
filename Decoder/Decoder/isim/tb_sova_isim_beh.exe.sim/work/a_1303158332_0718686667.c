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
static const char *ng0 = "D:/PhD/Semester/Term 1/VHDL/Project/Turbo Code/Decoder/Decoder/subs.vhd";
extern char *IEEE_P_3499444699;



static void work_a_1303158332_0718686667_p_0(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(17, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4620U);
    t4 = ieee_std_logic_arith_conv_integer_unsigned(IEEE_P_3499444699, t3, t2);
    t5 = (t0 + 1192U);
    t6 = *((char **)t5);
    t5 = (t0 + 4636U);
    t7 = ieee_std_logic_arith_conv_integer_unsigned(IEEE_P_3499444699, t6, t5);
    t8 = (t4 - t7);
    t9 = ieee_std_logic_arith_conv_unsigned_integer(IEEE_P_3499444699, t1, t8, 9);
    t10 = (t0 + 2912);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 9U);
    xsi_driver_first_trans_fast_port(t10);
    t2 = (t0 + 2832);
    *((int *)t2) = 1;

LAB1:    return;
}


extern void work_a_1303158332_0718686667_init()
{
	static char *pe[] = {(void *)work_a_1303158332_0718686667_p_0};
	xsi_register_didat("work_a_1303158332_0718686667", "isim/tb_sova_isim_beh.exe.sim/work/a_1303158332_0718686667.didat");
	xsi_register_executes(pe);
}
