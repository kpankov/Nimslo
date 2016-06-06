<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_2(15:0)" />
        <signal name="XLXN_3(15:0)" />
        <signal name="XLXN_4(15:0)" />
        <signal name="CLK" />
        <signal name="DataIn(15:0)" />
        <signal name="DataOut(15:0)" />
        <signal name="DQ(15:0)" />
        <signal name="OE" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11(15:0)" />
        <signal name="XLXN_12(15:0)" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_20" />
        <signal name="XLXN_21" />
        <signal name="XLXN_22" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="DataIn(15:0)" />
        <port polarity="Output" name="DataOut(15:0)" />
        <port polarity="BiDirectional" name="DQ(15:0)" />
        <port polarity="Input" name="OE" />
        <blockdef name="ifd16">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-128" y2="-140" x1="84" />
            <line x2="84" y1="-116" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <rect width="64" x="0" y="-268" height="24" />
            <rect width="64" x="320" y="-268" height="24" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
        </blockdef>
        <blockdef name="obuft16">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-48" y2="-96" x1="96" />
            <line x2="64" y1="-96" y2="-96" x1="96" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="64" y1="-96" y2="-96" x1="0" />
            <rect width="96" x="128" y="-44" height="24" />
        </blockdef>
        <block symbolname="ifd16" name="XLXI_5">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="DataIn(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_2(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="obuft16" name="XLXI_6">
            <blockpin signalname="XLXN_4(15:0)" name="I(15:0)" />
            <blockpin signalname="OE" name="T" />
            <blockpin signalname="DQ(15:0)" name="O(15:0)" />
        </block>
        <block symbolname="ifd16" name="XLXI_7">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_2(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_4(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="ifd16" name="XLXI_8">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_3(15:0)" name="D(15:0)" />
            <blockpin signalname="DataOut(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="ifd16" name="XLXI_9">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="DQ(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_3(15:0)" name="Q(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1360" y="1456" name="XLXI_5" orien="R0" />
        <branch name="XLXN_2(15:0)">
            <wire x2="1776" y1="1200" y2="1200" x1="1744" />
        </branch>
        <instance x="2160" y="1920" name="XLXI_9" orien="M0" />
        <branch name="XLXN_3(15:0)">
            <wire x2="1776" y1="1664" y2="1664" x1="1744" />
        </branch>
        <instance x="1744" y="1920" name="XLXI_8" orien="M0" />
        <branch name="XLXN_4(15:0)">
            <wire x2="2240" y1="1200" y2="1200" x1="2160" />
        </branch>
        <branch name="CLK">
            <wire x2="1280" y1="1328" y2="1328" x1="1200" />
            <wire x2="1344" y1="1328" y2="1328" x1="1280" />
            <wire x2="1360" y1="1328" y2="1328" x1="1344" />
            <wire x2="1280" y1="1328" y2="1456" x1="1280" />
            <wire x2="1760" y1="1456" y2="1456" x1="1280" />
            <wire x2="2240" y1="1456" y2="1456" x1="1760" />
            <wire x2="2240" y1="1456" y2="1792" x1="2240" />
            <wire x2="2240" y1="1792" y2="1920" x1="2240" />
            <wire x2="1760" y1="1792" y2="1792" x1="1744" />
            <wire x2="1760" y1="1792" y2="1920" x1="1760" />
            <wire x2="2240" y1="1920" y2="1920" x1="1760" />
            <wire x2="1776" y1="1328" y2="1328" x1="1760" />
            <wire x2="1760" y1="1328" y2="1456" x1="1760" />
            <wire x2="2240" y1="1792" y2="1792" x1="2160" />
        </branch>
        <branch name="DataIn(15:0)">
            <wire x2="1344" y1="1200" y2="1200" x1="1296" />
            <wire x2="1360" y1="1200" y2="1200" x1="1344" />
        </branch>
        <branch name="DataOut(15:0)">
            <wire x2="1344" y1="1664" y2="1664" x1="1312" />
            <wire x2="1360" y1="1664" y2="1664" x1="1344" />
        </branch>
        <branch name="DQ(15:0)">
            <wire x2="2512" y1="1664" y2="1664" x1="2160" />
            <wire x2="2512" y1="1200" y2="1200" x1="2464" />
            <wire x2="2560" y1="1200" y2="1200" x1="2512" />
            <wire x2="2512" y1="1200" y2="1664" x1="2512" />
        </branch>
        <branch name="OE">
            <wire x2="2224" y1="1040" y2="1040" x1="1184" />
            <wire x2="2224" y1="1040" y2="1136" x1="2224" />
            <wire x2="2240" y1="1136" y2="1136" x1="2224" />
        </branch>
        <instance x="1776" y="1456" name="XLXI_7" orien="R0" />
        <iomarker fontsize="28" x="2560" y="1200" name="DQ(15:0)" orien="R0" />
        <instance x="2240" y="1232" name="XLXI_6" orien="R0" />
        <iomarker fontsize="28" x="1200" y="1328" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="1184" y="1040" name="OE" orien="R180" />
        <iomarker fontsize="28" x="1296" y="1200" name="DataIn(15:0)" orien="R180" />
        <iomarker fontsize="28" x="1312" y="1664" name="DataOut(15:0)" orien="R180" />
    </sheet>
</drawing>