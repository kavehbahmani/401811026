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
static const char *ng0 = "D:/PhD/Semester/Term 1/VHDL/Project/Turbo Code/Decoder/Decoder/reduction.vhd";
extern char *IEEE_P_2592010699;
extern char *WORK_P_1987032454;

unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );


static void work_a_1014775317_0718686667_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    char *t5;
    char *t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    char *t12;
    int t13;
    int t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    int t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned char t25;
    unsigned char t26;
    char *t27;
    char *t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    int t33;
    int t34;
    char *t35;
    int t36;
    int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    unsigned char t45;
    int t46;
    int t47;

LAB0:    xsi_set_current_line(17, ng0);
    t1 = (t0 + 1488U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)3;
    xsi_set_current_line(18, ng0);
    t1 = (t0 + 4717);
    *((int *)t1) = 0;
    t2 = (t0 + 4721);
    *((int *)t2) = 7;
    t3 = 0;
    t4 = 7;

LAB2:    if (t3 <= t4)
        goto LAB3;

LAB5:    xsi_set_current_line(21, ng0);
    t1 = (t0 + 4725);
    *((int *)t1) = 0;
    t2 = (t0 + 4729);
    *((int *)t2) = 7;
    t3 = 0;
    t4 = 7;

LAB7:    if (t3 <= t4)
        goto LAB8;

LAB10:    t1 = (t0 + 2792);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(19, ng0);
    t5 = (t0 + 1488U);
    t6 = *((char **)t5);
    t7 = *((unsigned char *)t6);
    t5 = (t0 + 1032U);
    t8 = *((char **)t5);
    t5 = ((WORK_P_1987032454) + 2008U);
    t9 = *((char **)t5);
    t10 = *((int *)t9);
    t11 = (t10 - 1);
    t5 = ((WORK_P_1987032454) + 2008U);
    t12 = *((char **)t5);
    t13 = *((int *)t12);
    t14 = (t13 - 1);
    t15 = (t11 - t14);
    t16 = (t15 * -1);
    t17 = (1U * t16);
    t5 = (t0 + 4717);
    t18 = *((int *)t5);
    t19 = (t18 - 0);
    t20 = (t19 * 1);
    xsi_vhdl_check_range_of_index(0, 7, 1, *((int *)t5));
    t21 = (9U * t20);
    t22 = (0 + t21);
    t23 = (t22 + t17);
    t24 = (t8 + t23);
    t25 = *((unsigned char *)t24);
    t26 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t7, t25);
    t27 = (t0 + 1488U);
    t28 = *((char **)t27);
    t27 = (t28 + 0);
    *((unsigned char *)t27) = t26;

LAB4:    t1 = (t0 + 4717);
    t3 = *((int *)t1);
    t2 = (t0 + 4721);
    t4 = *((int *)t2);
    if (t3 == t4)
        goto LAB5;

LAB6:    t10 = (t3 + 1);
    t3 = t10;
    t5 = (t0 + 4717);
    *((int *)t5) = t3;
    goto LAB2;

LAB8:    xsi_set_current_line(22, ng0);
    t5 = (t0 + 1032U);
    t6 = *((char **)t5);
    t5 = ((WORK_P_1987032454) + 2008U);
    t8 = *((char **)t5);
    t10 = *((int *)t8);
    t11 = (t10 - 1);
    t5 = ((WORK_P_1987032454) + 2008U);
    t9 = *((char **)t5);
    t13 = *((int *)t9);
    t14 = (t13 - 2);
    t16 = (t11 - t14);
    t17 = (t16 * 1U);
    t5 = (t0 + 4725);
    t15 = *((int *)t5);
    t18 = (t15 - 0);
    t20 = (t18 * 1);
    xsi_vhdl_check_range_of_index(0, 7, 1, *((int *)t5));
    t21 = (9U * t20);
    t22 = (0 + t21);
    t23 = (t22 + t17);
    t12 = (t6 + t23);
    t24 = (t0 + 4725);
    t19 = *((int *)t24);
    t29 = (t19 - 0);
    t30 = (t29 * 1);
    t31 = (9U * t30);
    t32 = (0U + t31);
    t27 = ((WORK_P_1987032454) + 2008U);
    t28 = *((char **)t27);
    t33 = *((int *)t28);
    t34 = (t33 - 1);
    t27 = ((WORK_P_1987032454) + 2008U);
    t35 = *((char **)t27);
    t36 = *((int *)t35);
    t37 = (t36 - 2);
    t38 = (t34 - t37);
    t39 = (1U * t38);
    t40 = (t32 + t39);
    t27 = (t0 + 2872);
    t41 = (t27 + 56U);
    t42 = *((char **)t41);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    memcpy(t44, t12, 8U);
    xsi_driver_first_trans_delta(t27, t40, 8U, 0LL);
    xsi_set_current_line(23, ng0);
    t1 = (t0 + 1488U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t25 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t7);
    t1 = (t0 + 1032U);
    t5 = *((char **)t1);
    t1 = ((WORK_P_1987032454) + 2008U);
    t6 = *((char **)t1);
    t10 = *((int *)t6);
    t11 = (t10 - 1);
    t1 = ((WORK_P_1987032454) + 2008U);
    t8 = *((char **)t1);
    t13 = *((int *)t8);
    t14 = (t13 - 1);
    t15 = (t11 - t14);
    t16 = (t15 * -1);
    t17 = (1U * t16);
    t1 = (t0 + 4725);
    t18 = *((int *)t1);
    t19 = (t18 - 0);
    t20 = (t19 * 1);
    xsi_vhdl_check_range_of_index(0, 7, 1, *((int *)t1));
    t21 = (9U * t20);
    t22 = (0 + t21);
    t23 = (t22 + t17);
    t9 = (t5 + t23);
    t26 = *((unsigned char *)t9);
    t45 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t25, t26);
    t12 = (t0 + 4725);
    t29 = *((int *)t12);
    t33 = (t29 - 0);
    t30 = (t33 * 1);
    t31 = (9U * t30);
    t32 = (0U + t31);
    t24 = ((WORK_P_1987032454) + 2008U);
    t27 = *((char **)t24);
    t34 = *((int *)t27);
    t36 = (t34 - 1);
    t24 = ((WORK_P_1987032454) + 2008U);
    t28 = *((char **)t24);
    t37 = *((int *)t28);
    t46 = (t37 - 1);
    t47 = (t36 - t46);
    t38 = (t47 * -1);
    t39 = (1 * t38);
    t40 = (t32 + t39);
    t24 = (t0 + 2872);
    t35 = (t24 + 56U);
    t41 = *((char **)t35);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    *((unsigned char *)t43) = t45;
    xsi_driver_first_trans_delta(t24, t40, 1, 0LL);

LAB9:    t1 = (t0 + 4725);
    t3 = *((int *)t1);
    t2 = (t0 + 4729);
    t4 = *((int *)t2);
    if (t3 == t4)
        goto LAB10;

LAB11:    t10 = (t3 + 1);
    t3 = t10;
    t5 = (t0 + 4725);
    *((int *)t5) = t3;
    goto LAB7;

}


extern void work_a_1014775317_0718686667_init()
{
	static char *pe[] = {(void *)work_a_1014775317_0718686667_p_0};
	xsi_register_didat("work_a_1014775317_0718686667", "isim/tb_sova_isim_beh.exe.sim/work/a_1014775317_0718686667.didat");
	xsi_register_executes(pe);
}
