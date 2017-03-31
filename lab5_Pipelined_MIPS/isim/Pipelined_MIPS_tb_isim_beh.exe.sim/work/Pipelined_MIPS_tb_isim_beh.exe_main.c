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



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002905454951_4144471541_init();
    work_m_00000000000165558977_0278921292_init();
    work_m_00000000000813488503_0886308060_init();
    work_m_00000000001591554311_4138485272_init();
    work_m_00000000003282457385_3397424483_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003282457385_3397424483");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
