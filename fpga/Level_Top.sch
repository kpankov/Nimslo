<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK_50MHZ" />
        <signal name="SD_A(12:0)" />
        <signal name="SD_BA(1:0)" />
        <signal name="SD_DQ(15:0)" />
        <signal name="SD_CK_P" />
        <signal name="SD_CK_N" />
        <signal name="SD_CKE" />
        <signal name="SD_CS" />
        <signal name="SD_LDM" />
        <signal name="SD_UDM" />
        <signal name="SD_RAS" />
        <signal name="SD_CAS" />
        <signal name="SD_WE" />
        <signal name="SD_LDQS" />
        <signal name="SD_UDQS" />
        <signal name="LED(7:0)" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="XLXN_28(1:0)" />
        <signal name="XLXN_29(1:0)" />
        <signal name="XLXN_30(12:0)" />
        <signal name="XLXN_31(12:0)" />
        <signal name="XLXN_32(15:0)" />
        <signal name="XLXN_33(15:0)" />
        <signal name="XLXN_36" />
        <signal name="XLXN_37" />
        <signal name="XLXN_43" />
        <signal name="CLK_200MHz" />
        <port polarity="Input" name="CLK_50MHZ" />
        <port polarity="Output" name="SD_A(12:0)" />
        <port polarity="Output" name="SD_BA(1:0)" />
        <port polarity="BiDirectional" name="SD_DQ(15:0)" />
        <port polarity="Output" name="SD_CK_P" />
        <port polarity="Output" name="SD_CK_N" />
        <port polarity="Output" name="SD_CKE" />
        <port polarity="Output" name="SD_CS" />
        <port polarity="Output" name="SD_LDM" />
        <port polarity="Output" name="SD_UDM" />
        <port polarity="Output" name="SD_RAS" />
        <port polarity="Output" name="SD_CAS" />
        <port polarity="Output" name="SD_WE" />
        <port polarity="BiDirectional" name="SD_LDQS" />
        <port polarity="BiDirectional" name="SD_UDQS" />
        <port polarity="Output" name="LED(7:0)" />
        <blockdef name="Clocking">
            <timestamp>2016-6-2T22:6:21</timestamp>
            <line x2="464" y1="160" y2="160" x1="400" />
            <line x2="464" y1="96" y2="96" x1="400" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
            <rect width="336" x="64" y="-192" height="384" />
        </blockdef>
        <blockdef name="DDR_SDRAM_Controller">
            <timestamp>2016-6-5T22:23:48</timestamp>
            <line x2="432" y1="32" y2="32" x1="368" />
            <line x2="0" y1="-880" y2="-880" x1="64" />
            <line x2="0" y1="-768" y2="-768" x1="64" />
            <rect width="64" x="0" y="-668" height="24" />
            <line x2="0" y1="-656" y2="-656" x1="64" />
            <rect width="64" x="0" y="-556" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-444" height="24" />
            <line x2="0" y1="-432" y2="-432" x1="64" />
            <rect width="64" x="0" y="-332" height="24" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <rect width="64" x="0" y="-220" height="24" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="432" y1="-992" y2="-992" x1="368" />
            <line x2="432" y1="-928" y2="-928" x1="368" />
            <line x2="432" y1="-864" y2="-864" x1="368" />
            <line x2="432" y1="-800" y2="-800" x1="368" />
            <line x2="432" y1="-736" y2="-736" x1="368" />
            <line x2="432" y1="-672" y2="-672" x1="368" />
            <line x2="432" y1="-608" y2="-608" x1="368" />
            <line x2="432" y1="-544" y2="-544" x1="368" />
            <line x2="432" y1="-480" y2="-480" x1="368" />
            <line x2="432" y1="-416" y2="-416" x1="368" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <rect width="64" x="368" y="-300" height="24" />
            <line x2="432" y1="-288" y2="-288" x1="368" />
            <rect width="64" x="368" y="-236" height="24" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
            <rect width="304" x="64" y="-1024" height="1080" />
            <line x2="0" y1="-960" y2="-960" x1="64" />
        </blockdef>
        <blockdef name="DDR_Test">
            <timestamp>2016-6-5T14:32:30</timestamp>
            <rect width="384" x="64" y="-576" height="576" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="512" y1="-544" y2="-544" x1="448" />
            <line x2="512" y1="-480" y2="-480" x1="448" />
            <rect width="64" x="448" y="-428" height="24" />
            <line x2="512" y1="-416" y2="-416" x1="448" />
            <rect width="64" x="448" y="-364" height="24" />
            <line x2="512" y1="-352" y2="-352" x1="448" />
            <rect width="64" x="448" y="-300" height="24" />
            <line x2="512" y1="-288" y2="-288" x1="448" />
            <rect width="64" x="448" y="-236" height="24" />
            <line x2="512" y1="-224" y2="-224" x1="448" />
            <rect width="64" x="448" y="-172" height="24" />
            <line x2="512" y1="-160" y2="-160" x1="448" />
            <rect width="64" x="448" y="-108" height="24" />
            <line x2="512" y1="-96" y2="-96" x1="448" />
            <rect width="64" x="448" y="-44" height="24" />
            <line x2="512" y1="-32" y2="-32" x1="448" />
        </blockdef>
        <block symbolname="Clocking" name="XLXI_10">
            <blockpin signalname="CLK_50MHZ" name="CLKIN_IN" />
            <blockpin name="CLKDV_OUT" />
            <blockpin signalname="CLK_200MHz" name="CLKFX_OUT" />
            <blockpin name="CLKIN_IBUFG_OUT" />
            <blockpin name="CLK0_OUT" />
            <blockpin name="CLK2X_OUT" />
        </block>
        <block symbolname="DDR_SDRAM_Controller" name="XLXI_26">
            <blockpin signalname="XLXN_26" name="WrStart" />
            <blockpin signalname="XLXN_27" name="RdStart" />
            <blockpin signalname="XLXN_28(1:0)" name="WrBank(1:0)" />
            <blockpin signalname="XLXN_30(12:0)" name="WrAddr(12:0)" />
            <blockpin signalname="XLXN_32(15:0)" name="WrData(15:0)" />
            <blockpin signalname="XLXN_29(1:0)" name="RdBank(1:0)" />
            <blockpin signalname="XLXN_31(12:0)" name="RdAddr(12:0)" />
            <blockpin signalname="XLXN_33(15:0)" name="RdData(15:0)" />
            <blockpin signalname="SD_LDQS" name="IC_LDQS" />
            <blockpin signalname="SD_UDQS" name="IC_UDQS" />
            <blockpin signalname="SD_DQ(15:0)" name="IC_DQ(15:0)" />
            <blockpin signalname="SD_CK_P" name="IC_CK_P" />
            <blockpin signalname="SD_CK_N" name="IC_CK_N" />
            <blockpin signalname="SD_CKE" name="IC_CKE" />
            <blockpin signalname="SD_CS" name="IC_CS" />
            <blockpin signalname="SD_LDM" name="IC_LDM" />
            <blockpin signalname="SD_UDM" name="IC_UDM" />
            <blockpin signalname="SD_RAS" name="IC_RAS" />
            <blockpin signalname="SD_CAS" name="IC_CAS" />
            <blockpin signalname="SD_WE" name="IC_WE" />
            <blockpin signalname="XLXN_37" name="WrReady" />
            <blockpin signalname="XLXN_43" name="RdReady" />
            <blockpin signalname="XLXN_36" name="DevReady" />
            <blockpin signalname="SD_A(12:0)" name="IC_A(12:0)" />
            <blockpin signalname="SD_BA(1:0)" name="IC_BA(1:0)" />
            <blockpin signalname="CLK_200MHz" name="CLK_200MHz" />
        </block>
        <block symbolname="DDR_Test" name="XLXI_27">
            <blockpin signalname="XLXN_36" name="DDR_Ready" />
            <blockpin signalname="XLXN_37" name="DDR_WrReady" />
            <blockpin signalname="XLXN_43" name="DDR_RdReady" />
            <blockpin signalname="XLXN_33(15:0)" name="DDR_RdData(15:0)" />
            <blockpin signalname="XLXN_26" name="DDR_WrStart" />
            <blockpin signalname="XLXN_27" name="DDR_RdStart" />
            <blockpin signalname="XLXN_28(1:0)" name="DDR_WrBank(1:0)" />
            <blockpin signalname="XLXN_29(1:0)" name="DDR_RdBank(1:0)" />
            <blockpin signalname="XLXN_30(12:0)" name="DDR_WrAddr(12:0)" />
            <blockpin signalname="XLXN_31(12:0)" name="DDR_RdAddr(12:0)" />
            <blockpin signalname="XLXN_32(15:0)" name="DDR_WrData(15:0)" />
            <blockpin signalname="LED(7:0)" name="Status(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="752" y="1088" name="XLXI_10" orien="R0">
        </instance>
        <branch name="CLK_50MHZ">
            <wire x2="752" y1="928" y2="928" x1="688" />
        </branch>
        <iomarker fontsize="28" x="688" y="928" name="CLK_50MHZ" orien="R180" />
        <branch name="SD_A(12:0)">
            <wire x2="2608" y1="1776" y2="1776" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1776" name="SD_A(12:0)" orien="R0" />
        <branch name="SD_BA(1:0)">
            <wire x2="2608" y1="1840" y2="1840" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1840" name="SD_BA(1:0)" orien="R0" />
        <branch name="SD_DQ(15:0)">
            <wire x2="2608" y1="2032" y2="2032" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2608" y="2032" name="SD_DQ(15:0)" orien="R0" />
        <branch name="SD_CK_P">
            <wire x2="2608" y1="1072" y2="1072" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1072" name="SD_CK_P" orien="R0" />
        <iomarker fontsize="28" x="2608" y="1136" name="SD_CK_N" orien="R0" />
        <iomarker fontsize="28" x="2608" y="1200" name="SD_CKE" orien="R0" />
        <branch name="SD_CS">
            <wire x2="2608" y1="1264" y2="1264" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1264" name="SD_CS" orien="R0" />
        <branch name="SD_LDM">
            <wire x2="2608" y1="1328" y2="1328" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1328" name="SD_LDM" orien="R0" />
        <branch name="SD_UDM">
            <wire x2="2608" y1="1392" y2="1392" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1392" name="SD_UDM" orien="R0" />
        <branch name="SD_RAS">
            <wire x2="2608" y1="1456" y2="1456" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1456" name="SD_RAS" orien="R0" />
        <branch name="SD_CAS">
            <wire x2="2608" y1="1520" y2="1520" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1520" name="SD_CAS" orien="R0" />
        <branch name="SD_WE">
            <wire x2="2608" y1="1584" y2="1584" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1584" name="SD_WE" orien="R0" />
        <branch name="SD_LDQS">
            <wire x2="2608" y1="1904" y2="1904" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1904" name="SD_LDQS" orien="R0" />
        <branch name="SD_UDQS">
            <wire x2="2608" y1="1968" y2="1968" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1968" name="SD_UDQS" orien="R0" />
        <instance x="960" y="2064" name="XLXI_27" orien="R0">
        </instance>
        <branch name="LED(7:0)">
            <wire x2="1504" y1="1968" y2="1968" x1="1472" />
        </branch>
        <iomarker fontsize="28" x="1504" y="1968" name="LED(7:0)" orien="R0" />
        <branch name="XLXN_27">
            <wire x2="1904" y1="1584" y2="1584" x1="1472" />
            <wire x2="1904" y1="1296" y2="1584" x1="1904" />
            <wire x2="2144" y1="1296" y2="1296" x1="1904" />
        </branch>
        <branch name="XLXN_28(1:0)">
            <wire x2="1952" y1="1648" y2="1648" x1="1472" />
            <wire x2="1952" y1="1408" y2="1648" x1="1952" />
            <wire x2="2144" y1="1408" y2="1408" x1="1952" />
        </branch>
        <branch name="XLXN_29(1:0)">
            <wire x2="1808" y1="1712" y2="1712" x1="1472" />
            <wire x2="1808" y1="1712" y2="1744" x1="1808" />
            <wire x2="2144" y1="1744" y2="1744" x1="1808" />
        </branch>
        <branch name="XLXN_30(12:0)">
            <wire x2="2000" y1="1776" y2="1776" x1="1472" />
            <wire x2="2000" y1="1520" y2="1776" x1="2000" />
            <wire x2="2144" y1="1520" y2="1520" x1="2000" />
        </branch>
        <branch name="XLXN_31(12:0)">
            <wire x2="1808" y1="1840" y2="1840" x1="1472" />
            <wire x2="1808" y1="1840" y2="1856" x1="1808" />
            <wire x2="2144" y1="1856" y2="1856" x1="1808" />
        </branch>
        <branch name="XLXN_32(15:0)">
            <wire x2="2048" y1="1904" y2="1904" x1="1472" />
            <wire x2="2048" y1="1632" y2="1904" x1="2048" />
            <wire x2="2144" y1="1632" y2="1632" x1="2048" />
        </branch>
        <branch name="XLXN_33(15:0)">
            <wire x2="1808" y1="2032" y2="2032" x1="1472" />
            <wire x2="1808" y1="1968" y2="2032" x1="1808" />
            <wire x2="2144" y1="1968" y2="1968" x1="1808" />
        </branch>
        <branch name="XLXN_36">
            <wire x2="960" y1="1520" y2="1520" x1="864" />
            <wire x2="864" y1="1520" y2="2288" x1="864" />
            <wire x2="2928" y1="2288" y2="2288" x1="864" />
            <wire x2="2928" y1="2096" y2="2096" x1="2576" />
            <wire x2="2928" y1="2096" y2="2288" x1="2928" />
        </branch>
        <branch name="XLXN_37">
            <wire x2="960" y1="1776" y2="1776" x1="880" />
            <wire x2="880" y1="1776" y2="2256" x1="880" />
            <wire x2="2880" y1="2256" y2="2256" x1="880" />
            <wire x2="2880" y1="1648" y2="1648" x1="2576" />
            <wire x2="2880" y1="1648" y2="2256" x1="2880" />
        </branch>
        <branch name="SD_CKE">
            <wire x2="2608" y1="1200" y2="1200" x1="2576" />
        </branch>
        <branch name="SD_CK_N">
            <wire x2="2608" y1="1136" y2="1136" x1="2576" />
        </branch>
        <branch name="XLXN_26">
            <wire x2="1856" y1="1520" y2="1520" x1="1472" />
            <wire x2="1856" y1="1184" y2="1520" x1="1856" />
            <wire x2="2144" y1="1184" y2="1184" x1="1856" />
        </branch>
        <instance x="2144" y="2064" name="XLXI_26" orien="R0">
        </instance>
        <branch name="XLXN_43">
            <wire x2="960" y1="2032" y2="2032" x1="912" />
            <wire x2="912" y1="2032" y2="2240" x1="912" />
            <wire x2="2832" y1="2240" y2="2240" x1="912" />
            <wire x2="2832" y1="1712" y2="1712" x1="2576" />
            <wire x2="2832" y1="1712" y2="2240" x1="2832" />
        </branch>
        <branch name="CLK_200MHz">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1328" y="1184" type="branch" />
            <wire x2="1328" y1="1184" y2="1184" x1="1216" />
            <wire x2="1680" y1="1184" y2="1184" x1="1328" />
            <wire x2="1680" y1="1104" y2="1184" x1="1680" />
            <wire x2="2144" y1="1104" y2="1104" x1="1680" />
        </branch>
    </sheet>
</drawing>