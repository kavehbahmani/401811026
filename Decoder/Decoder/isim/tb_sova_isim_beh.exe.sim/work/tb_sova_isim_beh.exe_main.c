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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *STD_STANDARD;
char *IEEE_P_2592010699;
char *IEEE_P_3499444699;
char *IEEE_P_1242562249;
char *WORK_P_1987032454;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    work_p_1987032454_init();
    ieee_p_3499444699_init();
    work_a_3453415519_0718686667_init();
    work_a_3423902312_0718686667_init();
    work_a_3461489713_0718686667_init();
    work_a_3482340870_0718686667_init();
    work_a_3403634819_0718686667_init();
    work_a_3407688372_0718686667_init();
    work_a_3378220269_0718686667_init();
    work_a_3365529306_0718686667_init();
    work_a_4145256154_0718686667_init();
    work_a_3156080020_0718686667_init();
    work_a_1193701174_0718686667_init();
    work_a_1276030917_0718686667_init();
    work_a_1014775317_0718686667_init();
    work_a_0320990417_0718686667_init();
    work_a_2919247031_0718686667_init();
    work_a_1645008994_0718686667_init();
    work_a_3200337851_0718686667_init();
    work_a_1310129500_0718686667_init();
    work_a_1303158332_0718686667_init();
    work_a_3023658813_0718686667_init();
    work_a_0464974986_0718686667_init();
    work_a_1496512972_0718686667_init();
    work_a_3004556050_0718686667_init();
    work_a_3251515712_0718686667_init();
    work_a_0815652888_0718686667_init();
    work_a_2758735697_0718686667_init();
    work_a_1604997714_0718686667_init();
    work_a_3014766612_0718686667_init();
    work_a_0257717545_0718686667_init();
    work_a_0919685612_0718686667_init();
    work_a_3284077640_0718686667_init();
    work_a_2872714842_0718686667_init();
    work_a_2105251715_0718686667_init();
    work_a_1034222397_0718686667_init();
    work_a_3616088712_0718686667_init();
    work_a_1529753644_2372691052_init();


    xsi_register_tops("work_a_1529753644_2372691052");

    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    WORK_P_1987032454 = xsi_get_engine_memory("work_p_1987032454");

    return xsi_run_simulation(argc, argv);

}
