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
static const char *ng0 = "C:/Users/Victor Espinoza/Documents/Long Beach/Victor's Projects To Upload/Spring 2015/CECS 440/Lab 5 - Pipelined MIPS/lab5_Pipelined_MIPS/ALU.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {4U, 0U};
static unsigned int ng6[] = {5U, 0U};
static unsigned int ng7[] = {6U, 0U};
static unsigned int ng8[] = {7U, 0U};
static unsigned int ng9[] = {8U, 0U};
static unsigned int ng10[] = {9U, 0U};
static unsigned int ng11[] = {10U, 0U};
static unsigned int ng12[] = {11U, 0U};
static unsigned int ng13[] = {12U, 0U};
static unsigned int ng14[] = {13U, 0U};
static unsigned int ng15[] = {14U, 0U};
static unsigned int ng16[] = {15U, 0U};
static unsigned int ng17[] = {16U, 0U};
static unsigned int ng18[] = {17U, 0U};
static unsigned int ng19[] = {18U, 0U};
static unsigned int ng20[] = {4294967295U, 4294967295U};



static void Always_79_0(char *t0)
{
    char t6[8];
    char t7[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    int t15;
    int t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;

LAB0:    t1 = (t0 + 3488U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 4056);
    *((int *)t2) = 1;
    t3 = (t0 + 3520);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(79, ng0);

LAB5:    xsi_set_current_line(80, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 2248);
    xsi_vlogvar_assign_value(t4, t5, 0, 0, 32);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = (t0 + 2408);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 32);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t7, 0, 8);
    t2 = (t7 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 0);
    *((unsigned int *)t7) = t9;
    t10 = *((unsigned int *)t4);
    t11 = (t10 >> 0);
    *((unsigned int *)t2) = t11;
    t12 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t12 & 65535U);
    t13 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t13 & 65535U);
    t5 = ((char*)((ng1)));
    xsi_vlogtype_concat(t6, 32, 32, 2U, t5, 16, t7, 16);
    t14 = (t0 + 2088);
    xsi_vlogvar_assign_value(t14, t6, 0, 0, 32);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);

LAB6:    t2 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB7;

LAB8:    t4 = ((char*)((ng2)));
    t16 = xsi_vlog_unsigned_case_compare(t3, 5, t4, 5);
    if (t16 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng8)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng9)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng10)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng11)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng12)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng13)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng14)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng15)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng16)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB37;

LAB38:    t2 = ((char*)((ng17)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB39;

LAB40:    t2 = ((char*)((ng18)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB41;

LAB42:    t2 = ((char*)((ng19)));
    t15 = xsi_vlog_unsigned_case_compare(t3, 5, t2, 5);
    if (t15 == 1)
        goto LAB43;

LAB44:
LAB46:
LAB45:    xsi_set_current_line(154, ng0);
    t2 = ((char*)((ng20)));
    t4 = (t0 + 1928);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 32);

LAB47:    goto LAB2;

LAB7:    goto LAB47;

LAB9:    xsi_set_current_line(87, ng0);

LAB48:    xsi_set_current_line(88, ng0);
    t5 = (t0 + 2248);
    t14 = (t5 + 56U);
    t17 = *((char **)t14);
    t18 = (t0 + 2408);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t17, 32, t20, 32);
    t21 = (t0 + 2568);
    xsi_vlogvar_assign_value(t21, t6, 0, 0, 32);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 2568);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t14 = (t0 + 1928);
    xsi_vlogvar_assign_value(t14, t5, 0, 0, 32);
    goto LAB47;

LAB11:    xsi_set_current_line(92, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 1208U);
    t14 = *((char **)t4);
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 32, t5, 32, t14, 32);
    t4 = (t0 + 1928);
    xsi_vlogvar_assign_value(t4, t6, 0, 0, 32);
    goto LAB47;

LAB13:    xsi_set_current_line(94, ng0);

LAB49:    xsi_set_current_line(95, ng0);
    t4 = (t0 + 2248);
    t5 = (t4 + 56U);
    t14 = *((char **)t5);
    t17 = (t0 + 2408);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memset(t6, 0, 8);
    xsi_vlog_signed_minus(t6, 32, t14, 32, t19, 32);
    t20 = (t0 + 2568);
    xsi_vlogvar_assign_value(t20, t6, 0, 0, 32);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 2568);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t14 = (t0 + 1928);
    xsi_vlogvar_assign_value(t14, t5, 0, 0, 32);
    goto LAB47;

LAB15:    xsi_set_current_line(99, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 1208U);
    t14 = *((char **)t4);
    memset(t6, 0, 8);
    xsi_vlog_unsigned_minus(t6, 32, t5, 32, t14, 32);
    t4 = (t0 + 1928);
    xsi_vlogvar_assign_value(t4, t6, 0, 0, 32);
    goto LAB47;

LAB17:    xsi_set_current_line(101, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 1208U);
    t14 = *((char **)t4);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t14);
    t10 = (t8 & t9);
    *((unsigned int *)t6) = t10;
    t4 = (t5 + 4);
    t17 = (t14 + 4);
    t18 = (t6 + 4);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t17);
    t13 = (t11 | t12);
    *((unsigned int *)t18) = t13;
    t22 = *((unsigned int *)t18);
    t23 = (t22 != 0);
    if (t23 == 1)
        goto LAB50;

LAB51:
LAB52:    t21 = (t0 + 1928);
    xsi_vlogvar_assign_value(t21, t6, 0, 0, 32);
    goto LAB47;

LAB19:    xsi_set_current_line(103, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 1208U);
    t14 = *((char **)t4);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t14);
    t10 = (t8 | t9);
    *((unsigned int *)t6) = t10;
    t4 = (t5 + 4);
    t17 = (t14 + 4);
    t18 = (t6 + 4);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t17);
    t13 = (t11 | t12);
    *((unsigned int *)t18) = t13;
    t22 = *((unsigned int *)t18);
    t23 = (t22 != 0);
    if (t23 == 1)
        goto LAB53;

LAB54:
LAB55:    t21 = (t0 + 1928);
    xsi_vlogvar_assign_value(t21, t6, 0, 0, 32);
    goto LAB47;

LAB21:    xsi_set_current_line(105, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 1208U);
    t14 = *((char **)t4);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t14);
    t10 = (t8 ^ t9);
    *((unsigned int *)t6) = t10;
    t4 = (t5 + 4);
    t17 = (t14 + 4);
    t18 = (t6 + 4);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t17);
    t13 = (t11 | t12);
    *((unsigned int *)t18) = t13;
    t22 = *((unsigned int *)t18);
    t23 = (t22 != 0);
    if (t23 == 1)
        goto LAB56;

LAB57:
LAB58:    t19 = (t0 + 1928);
    xsi_vlogvar_assign_value(t19, t6, 0, 0, 32);
    goto LAB47;

LAB23:    xsi_set_current_line(107, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 1208U);
    t14 = *((char **)t4);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t14);
    t10 = (t8 | t9);
    *((unsigned int *)t7) = t10;
    t4 = (t5 + 4);
    t17 = (t14 + 4);
    t18 = (t7 + 4);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t17);
    t13 = (t11 | t12);
    *((unsigned int *)t18) = t13;
    t22 = *((unsigned int *)t18);
    t23 = (t22 != 0);
    if (t23 == 1)
        goto LAB59;

LAB60:
LAB61:    memset(t6, 0, 8);
    t21 = (t6 + 4);
    t41 = (t7 + 4);
    t37 = *((unsigned int *)t7);
    t38 = (~(t37));
    *((unsigned int *)t6) = t38;
    *((unsigned int *)t21) = 0;
    if (*((unsigned int *)t41) != 0)
        goto LAB63;

LAB62:    t44 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t44 & 4294967295U);
    t45 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t45 & 4294967295U);
    t46 = (t0 + 1928);
    xsi_vlogvar_assign_value(t46, t6, 0, 0, 32);
    goto LAB47;

LAB25:    xsi_set_current_line(109, ng0);

LAB64:    xsi_set_current_line(110, ng0);
    t4 = (t0 + 2248);
    t5 = (t4 + 56U);
    t14 = *((char **)t5);
    t17 = (t0 + 2408);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memset(t6, 0, 8);
    xsi_vlog_signed_less(t6, 32, t14, 32, t19, 32);
    t20 = (t6 + 4);
    t8 = *((unsigned int *)t20);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB65;

LAB66:    xsi_set_current_line(113, ng0);
    t2 = ((char*)((ng1)));
    t4 = (t0 + 2568);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 32);

LAB67:    xsi_set_current_line(114, ng0);
    t2 = (t0 + 2568);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t14 = (t0 + 1928);
    xsi_vlogvar_assign_value(t14, t5, 0, 0, 32);
    goto LAB47;

LAB27:    xsi_set_current_line(117, ng0);

LAB68:    xsi_set_current_line(118, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 1208U);
    t14 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t5 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB70;

LAB69:    t17 = (t14 + 4);
    if (*((unsigned int *)t17) != 0)
        goto LAB70;

LAB73:    if (*((unsigned int *)t5) < *((unsigned int *)t14))
        goto LAB71;

LAB72:    t19 = (t6 + 4);
    t8 = *((unsigned int *)t19);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB74;

LAB75:    xsi_set_current_line(121, ng0);
    t2 = ((char*)((ng1)));
    t4 = (t0 + 1928);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 32);

LAB76:    goto LAB47;

LAB29:    xsi_set_current_line(124, ng0);

LAB77:    xsi_set_current_line(125, ng0);
    t4 = (t0 + 2248);
    t5 = (t4 + 56U);
    t14 = *((char **)t5);
    t17 = (t0 + 2408);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t14, 32, t19, 32);
    t20 = (t0 + 2568);
    xsi_vlogvar_assign_value(t20, t6, 0, 0, 32);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 2568);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t14 = (t0 + 1928);
    xsi_vlogvar_assign_value(t14, t5, 0, 0, 32);
    goto LAB47;

LAB31:    xsi_set_current_line(129, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 2088);
    t14 = (t4 + 56U);
    t17 = *((char **)t14);
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 32, t5, 32, t17, 32);
    t18 = (t0 + 1928);
    xsi_vlogvar_assign_value(t18, t6, 0, 0, 32);
    goto LAB47;

LAB33:    xsi_set_current_line(131, ng0);

LAB78:    xsi_set_current_line(132, ng0);
    t4 = (t0 + 2248);
    t5 = (t4 + 56U);
    t14 = *((char **)t5);
    t17 = (t0 + 2408);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memset(t6, 0, 8);
    xsi_vlog_signed_less(t6, 32, t14, 32, t19, 32);
    t20 = (t6 + 4);
    t8 = *((unsigned int *)t20);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB79;

LAB80:    xsi_set_current_line(135, ng0);
    t2 = ((char*)((ng1)));
    t4 = (t0 + 2568);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 32);

LAB81:    xsi_set_current_line(136, ng0);
    t2 = (t0 + 2568);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t14 = (t0 + 1928);
    xsi_vlogvar_assign_value(t14, t5, 0, 0, 32);
    goto LAB47;

LAB35:    xsi_set_current_line(139, ng0);

LAB82:    xsi_set_current_line(140, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 2088);
    t14 = (t4 + 56U);
    t17 = *((char **)t14);
    memset(t6, 0, 8);
    t18 = (t5 + 4);
    if (*((unsigned int *)t18) != 0)
        goto LAB84;

LAB83:    t19 = (t17 + 4);
    if (*((unsigned int *)t19) != 0)
        goto LAB84;

LAB87:    if (*((unsigned int *)t5) < *((unsigned int *)t17))
        goto LAB85;

LAB86:    t21 = (t6 + 4);
    t8 = *((unsigned int *)t21);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB88;

LAB89:    xsi_set_current_line(143, ng0);
    t2 = ((char*)((ng1)));
    t4 = (t0 + 1928);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 32);

LAB90:    goto LAB47;

LAB37:    xsi_set_current_line(146, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 2088);
    t14 = (t4 + 56U);
    t17 = *((char **)t14);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t17);
    t10 = (t8 & t9);
    *((unsigned int *)t6) = t10;
    t18 = (t5 + 4);
    t19 = (t17 + 4);
    t20 = (t6 + 4);
    t11 = *((unsigned int *)t18);
    t12 = *((unsigned int *)t19);
    t13 = (t11 | t12);
    *((unsigned int *)t20) = t13;
    t22 = *((unsigned int *)t20);
    t23 = (t22 != 0);
    if (t23 == 1)
        goto LAB91;

LAB92:
LAB93:    t46 = (t0 + 1928);
    xsi_vlogvar_assign_value(t46, t6, 0, 0, 32);
    goto LAB47;

LAB39:    xsi_set_current_line(148, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 2088);
    t14 = (t4 + 56U);
    t17 = *((char **)t14);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t17);
    t10 = (t8 | t9);
    *((unsigned int *)t6) = t10;
    t18 = (t5 + 4);
    t19 = (t17 + 4);
    t20 = (t6 + 4);
    t11 = *((unsigned int *)t18);
    t12 = *((unsigned int *)t19);
    t13 = (t11 | t12);
    *((unsigned int *)t20) = t13;
    t22 = *((unsigned int *)t20);
    t23 = (t22 != 0);
    if (t23 == 1)
        goto LAB94;

LAB95:
LAB96:    t46 = (t0 + 1928);
    xsi_vlogvar_assign_value(t46, t6, 0, 0, 32);
    goto LAB47;

LAB41:    xsi_set_current_line(150, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 2088);
    t14 = (t4 + 56U);
    t17 = *((char **)t14);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t17);
    t10 = (t8 ^ t9);
    *((unsigned int *)t6) = t10;
    t18 = (t5 + 4);
    t19 = (t17 + 4);
    t20 = (t6 + 4);
    t11 = *((unsigned int *)t18);
    t12 = *((unsigned int *)t19);
    t13 = (t11 | t12);
    *((unsigned int *)t20) = t13;
    t22 = *((unsigned int *)t20);
    t23 = (t22 != 0);
    if (t23 == 1)
        goto LAB97;

LAB98:
LAB99:    t21 = (t0 + 1928);
    xsi_vlogvar_assign_value(t21, t6, 0, 0, 32);
    goto LAB47;

LAB43:    xsi_set_current_line(152, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 1208U);
    t14 = *((char **)t5);
    memset(t7, 0, 8);
    t5 = (t7 + 4);
    t17 = (t14 + 4);
    t8 = *((unsigned int *)t14);
    t9 = (t8 >> 0);
    *((unsigned int *)t7) = t9;
    t10 = *((unsigned int *)t17);
    t11 = (t10 >> 0);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t12 & 65535U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 65535U);
    xsi_vlogtype_concat(t6, 32, 32, 2U, t7, 16, t4, 16);
    t18 = (t0 + 1928);
    xsi_vlogvar_assign_value(t18, t6, 0, 0, 32);
    goto LAB47;

LAB50:    t24 = *((unsigned int *)t6);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t6) = (t24 | t25);
    t19 = (t5 + 4);
    t20 = (t14 + 4);
    t26 = *((unsigned int *)t5);
    t27 = (~(t26));
    t28 = *((unsigned int *)t19);
    t29 = (~(t28));
    t30 = *((unsigned int *)t14);
    t31 = (~(t30));
    t32 = *((unsigned int *)t20);
    t33 = (~(t32));
    t16 = (t27 & t29);
    t34 = (t31 & t33);
    t35 = (~(t16));
    t36 = (~(t34));
    t37 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t37 & t35);
    t38 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t38 & t36);
    t39 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t39 & t35);
    t40 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t40 & t36);
    goto LAB52;

LAB53:    t24 = *((unsigned int *)t6);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t6) = (t24 | t25);
    t19 = (t5 + 4);
    t20 = (t14 + 4);
    t26 = *((unsigned int *)t19);
    t27 = (~(t26));
    t28 = *((unsigned int *)t5);
    t16 = (t28 & t27);
    t29 = *((unsigned int *)t20);
    t30 = (~(t29));
    t31 = *((unsigned int *)t14);
    t34 = (t31 & t30);
    t32 = (~(t16));
    t33 = (~(t34));
    t35 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t35 & t32);
    t36 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t36 & t33);
    goto LAB55;

LAB56:    t24 = *((unsigned int *)t6);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t6) = (t24 | t25);
    goto LAB58;

LAB59:    t24 = *((unsigned int *)t7);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t7) = (t24 | t25);
    t19 = (t5 + 4);
    t20 = (t14 + 4);
    t26 = *((unsigned int *)t19);
    t27 = (~(t26));
    t28 = *((unsigned int *)t5);
    t16 = (t28 & t27);
    t29 = *((unsigned int *)t20);
    t30 = (~(t29));
    t31 = *((unsigned int *)t14);
    t34 = (t31 & t30);
    t32 = (~(t16));
    t33 = (~(t34));
    t35 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t35 & t32);
    t36 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t36 & t33);
    goto LAB61;

LAB63:    t39 = *((unsigned int *)t6);
    t40 = *((unsigned int *)t41);
    *((unsigned int *)t6) = (t39 | t40);
    t42 = *((unsigned int *)t21);
    t43 = *((unsigned int *)t41);
    *((unsigned int *)t21) = (t42 | t43);
    goto LAB62;

LAB65:    xsi_set_current_line(111, ng0);
    t21 = ((char*)((ng2)));
    t41 = (t0 + 2568);
    xsi_vlogvar_assign_value(t41, t21, 0, 0, 32);
    goto LAB67;

LAB70:    t18 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB72;

LAB71:    *((unsigned int *)t6) = 1;
    goto LAB72;

LAB74:    xsi_set_current_line(119, ng0);
    t20 = ((char*)((ng2)));
    t21 = (t0 + 1928);
    xsi_vlogvar_assign_value(t21, t20, 0, 0, 32);
    goto LAB76;

LAB79:    xsi_set_current_line(133, ng0);
    t21 = ((char*)((ng2)));
    t41 = (t0 + 2568);
    xsi_vlogvar_assign_value(t41, t21, 0, 0, 32);
    goto LAB81;

LAB84:    t20 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB86;

LAB85:    *((unsigned int *)t6) = 1;
    goto LAB86;

LAB88:    xsi_set_current_line(141, ng0);
    t41 = ((char*)((ng2)));
    t46 = (t0 + 1928);
    xsi_vlogvar_assign_value(t46, t41, 0, 0, 32);
    goto LAB90;

LAB91:    t24 = *((unsigned int *)t6);
    t25 = *((unsigned int *)t20);
    *((unsigned int *)t6) = (t24 | t25);
    t21 = (t5 + 4);
    t41 = (t17 + 4);
    t26 = *((unsigned int *)t5);
    t27 = (~(t26));
    t28 = *((unsigned int *)t21);
    t29 = (~(t28));
    t30 = *((unsigned int *)t17);
    t31 = (~(t30));
    t32 = *((unsigned int *)t41);
    t33 = (~(t32));
    t16 = (t27 & t29);
    t34 = (t31 & t33);
    t35 = (~(t16));
    t36 = (~(t34));
    t37 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t37 & t35);
    t38 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t38 & t36);
    t39 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t39 & t35);
    t40 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t40 & t36);
    goto LAB93;

LAB94:    t24 = *((unsigned int *)t6);
    t25 = *((unsigned int *)t20);
    *((unsigned int *)t6) = (t24 | t25);
    t21 = (t5 + 4);
    t41 = (t17 + 4);
    t26 = *((unsigned int *)t21);
    t27 = (~(t26));
    t28 = *((unsigned int *)t5);
    t16 = (t28 & t27);
    t29 = *((unsigned int *)t41);
    t30 = (~(t29));
    t31 = *((unsigned int *)t17);
    t34 = (t31 & t30);
    t32 = (~(t16));
    t33 = (~(t34));
    t35 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t35 & t32);
    t36 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t36 & t33);
    goto LAB96;

LAB97:    t24 = *((unsigned int *)t6);
    t25 = *((unsigned int *)t20);
    *((unsigned int *)t6) = (t24 | t25);
    goto LAB99;

}

static void Cont_160_1(char *t0)
{
    char t3[8];
    char t4[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;

LAB0:    t1 = (t0 + 3736U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(160, ng0);
    t2 = (t0 + 1928);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 4294967295U);
    if (t12 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t7) != 0)
        goto LAB6;

LAB7:    memset(t3, 0, 8);
    t14 = (t4 + 4);
    t15 = *((unsigned int *)t14);
    t16 = (~(t15));
    t17 = *((unsigned int *)t4);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB11;

LAB9:    if (*((unsigned int *)t14) == 0)
        goto LAB8;

LAB10:    t20 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t20) = 1;

LAB11:    t21 = (t3 + 4);
    t22 = (t4 + 4);
    t23 = *((unsigned int *)t4);
    t24 = (~(t23));
    *((unsigned int *)t3) = t24;
    *((unsigned int *)t21) = 0;
    if (*((unsigned int *)t22) != 0)
        goto LAB13;

LAB12:    t29 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t29 & 1U);
    t30 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t30 & 1U);
    t31 = (t0 + 4152);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    memset(t35, 0, 8);
    t36 = 1U;
    t37 = t36;
    t38 = (t3 + 4);
    t39 = *((unsigned int *)t3);
    t36 = (t36 & t39);
    t40 = *((unsigned int *)t38);
    t37 = (t37 & t40);
    t41 = (t35 + 4);
    t42 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t42 | t36);
    t43 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t43 | t37);
    xsi_driver_vfirst_trans(t31, 0, 0);
    t44 = (t0 + 4072);
    *((int *)t44) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t3) = 1;
    goto LAB11;

LAB13:    t25 = *((unsigned int *)t3);
    t26 = *((unsigned int *)t22);
    *((unsigned int *)t3) = (t25 | t26);
    t27 = *((unsigned int *)t21);
    t28 = *((unsigned int *)t22);
    *((unsigned int *)t21) = (t27 | t28);
    goto LAB12;

}


extern void work_m_00000000000813488503_0886308060_init()
{
	static char *pe[] = {(void *)Always_79_0,(void *)Cont_160_1};
	xsi_register_didat("work_m_00000000000813488503_0886308060", "isim/Pipelined_MIPS_tb_isim_beh.exe.sim/work/m_00000000000813488503_0886308060.didat");
	xsi_register_executes(pe);
}
