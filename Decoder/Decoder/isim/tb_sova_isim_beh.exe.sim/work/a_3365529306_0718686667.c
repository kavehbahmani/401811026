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
static const char *ng0 = "D:/PhD/Semester/Term 1/VHDL/Project/Turbo Code/Decoder/Decoder/partDistance.vhd";
extern char *IEEE_P_3499444699;
extern char *WORK_P_1987032454;



static void work_a_3365529306_0718686667_p_0(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(26, ng0);

LAB3:    t2 = ieee_std_logic_arith_conv_unsigned_integer(IEEE_P_3499444699, t1, 7, 3);
    t3 = (t0 + 4240);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t2, 3U);
    xsi_driver_first_trans_fast(t3);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3365529306_0718686667_p_1(char *t0)
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
    int t11;
    int t12;
    char *t13;
    char *t14;
    int t15;
    int t16;
    char *t17;
    char *t18;
    int t19;
    int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(45, ng0);

LAB3:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 6768U);
    t4 = ieee_std_logic_arith_conv_integer_signed(IEEE_P_3499444699, t3, t2);
    t5 = (t0 + 1832U);
    t6 = *((char **)t5);
    t5 = (t0 + 6848U);
    t7 = ieee_std_logic_arith_conv_integer_signed(IEEE_P_3499444699, t6, t5);
    t8 = (t4 + t7);
    t9 = (t0 + 1992U);
    t10 = *((char **)t9);
    t9 = (t0 + 6864U);
    t11 = ieee_std_logic_arith_conv_integer_signed(IEEE_P_3499444699, t10, t9);
    t12 = (t8 + t11);
    t13 = (t0 + 2152U);
    t14 = *((char **)t13);
    t13 = (t0 + 6880U);
    t15 = ieee_std_logic_arith_conv_integer_signed(IEEE_P_3499444699, t14, t13);
    t16 = (t12 + t15);
    t17 = ((WORK_P_1987032454) + 1768U);
    t18 = *((char **)t17);
    t19 = *((int *)t18);
    t20 = (t19 + 2);
    t17 = ieee_std_logic_arith_conv_signed_integer(IEEE_P_3499444699, t1, t16, t20);
    t21 = (t0 + 4304);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t17, 6U);
    xsi_driver_first_trans_fast_port(t21);

LAB2:    t26 = (t0 + 4160);
    *((int *)t26) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3365529306_0718686667_init()
{
	static char *pe[] = {(void *)work_a_3365529306_0718686667_p_0,(void *)work_a_3365529306_0718686667_p_1};
	xsi_register_didat("work_a_3365529306_0718686667", "isim/tb_sova_isim_beh.exe.sim/work/a_3365529306_0718686667.didat");
	xsi_register_executes(pe);
}
