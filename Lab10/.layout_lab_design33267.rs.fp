###############################################################
#  Generated by:      Cadence Innovus 16.12-s051_1
#  OS:                Linux x86_64(Host ID ecegrid-thin6.ecn.purdue.edu)
#  Generated on:      Wed Apr  8 16:13:55 2020
#  Design:            layout_lab_design
#  Command:           floorPlan -r 1.0 0.6 50 50 50 50
###############################################################

Version: 8

Head Box: 0.0000 0.0000 1500.0000 1500.0000
IO Box: 300.0000 300.0000 1200.0000 1200.0000
Core Box: 300.0000 300.0000 1200.0000 1200.0000
UseStdUtil: false

######################################################
#  DesignRoutingHalo: <space> <bottomLayerName> <topLayerName>
######################################################

######################################################
#  Core Rows Parameters:                             #
######################################################
Row Spacing = 0.000000
Row SpacingType = 2
Row Flip = 2
Core Row Site: core 

##############################################################################
#  DefRow: <name> <site> <x> <y> <orient> <num_x> <num_y> <step_x> <step_y>  #
##############################################################################
DefRow: ROW_0 core 300.0000 300.0000 FS 375 1 2.4000 0.0000
DefRow: ROW_1 core 300.0000 330.0000 N 375 1 2.4000 0.0000
DefRow: ROW_2 core 300.0000 360.0000 FS 375 1 2.4000 0.0000
DefRow: ROW_3 core 300.0000 390.0000 N 375 1 2.4000 0.0000
DefRow: ROW_4 core 300.0000 420.0000 FS 375 1 2.4000 0.0000
DefRow: ROW_5 core 300.0000 450.0000 N 375 1 2.4000 0.0000
DefRow: ROW_6 core 300.0000 480.0000 FS 375 1 2.4000 0.0000
DefRow: ROW_7 core 300.0000 510.0000 N 375 1 2.4000 0.0000
DefRow: ROW_8 core 300.0000 540.0000 FS 375 1 2.4000 0.0000
DefRow: ROW_9 core 300.0000 570.0000 N 375 1 2.4000 0.0000
DefRow: ROW_10 core 300.0000 600.0000 FS 375 1 2.4000 0.0000
DefRow: ROW_11 core 300.0000 630.0000 N 375 1 2.4000 0.0000
DefRow: ROW_12 core 300.0000 660.0000 FS 375 1 2.4000 0.0000
DefRow: ROW_13 core 300.0000 690.0000 N 375 1 2.4000 0.0000
DefRow: ROW_14 core 300.0000 720.0000 FS 375 1 2.4000 0.0000
DefRow: ROW_15 core 300.0000 750.0000 N 375 1 2.4000 0.0000
DefRow: ROW_16 core 300.0000 780.0000 FS 375 1 2.4000 0.0000
DefRow: ROW_17 core 300.0000 810.0000 N 375 1 2.4000 0.0000
DefRow: ROW_18 core 300.0000 840.0000 FS 375 1 2.4000 0.0000
DefRow: ROW_19 core 300.0000 870.0000 N 375 1 2.4000 0.0000
DefRow: ROW_20 core 300.0000 900.0000 FS 375 1 2.4000 0.0000
DefRow: ROW_21 core 300.0000 930.0000 N 375 1 2.4000 0.0000
DefRow: ROW_22 core 300.0000 960.0000 FS 375 1 2.4000 0.0000
DefRow: ROW_23 core 300.0000 990.0000 N 375 1 2.4000 0.0000
DefRow: ROW_24 core 300.0000 1020.0000 FS 375 1 2.4000 0.0000
DefRow: ROW_25 core 300.0000 1050.0000 N 375 1 2.4000 0.0000
DefRow: ROW_26 core 300.0000 1080.0000 FS 375 1 2.4000 0.0000
DefRow: ROW_27 core 300.0000 1110.0000 N 375 1 2.4000 0.0000
DefRow: ROW_28 core 300.0000 1140.0000 FS 375 1 2.4000 0.0000
DefRow: ROW_29 core 300.0000 1170.0000 N 375 1 2.4000 0.0000

############################################################################################
#  Track: dir start number space layer_num layer1 [firstColor] [isSameColor] [width] [rule]#
############################################################################################
Track: X 1.2000 625 2.4000 1 3
Track: Y 1.5000 500 3.0000 1 3
Track: Y 1.5000 500 3.0000 1 2
Track: X 1.2000 625 2.4000 1 2
Track: X 1.2000 625 2.4000 1 1
Track: Y 1.5000 500 3.0000 1 1

######################################################
#  GCellGrid: dir start number space                 #
######################################################
GCellGrid: X 1489.2000 2 10.8000
GCellGrid: X 1.2000 63 24.0000
GCellGrid: X 0.0000 2 1.2000
GCellGrid: Y 1471.5000 2 28.5000
GCellGrid: Y 1.5000 50 30.0000
GCellGrid: Y 0.0000 2 1.5000

######################################################
#  SpareCell: cellName                               #
#  SpareInst: instName                               #
######################################################

###############################1p########################
#  <SelectiveBlockage>                                #
#     <cell name="cell_name" />                     #
#  </SelectiveBlockage                                #
#######################################################

######################################################
#  ScanGroup: groupName startPin stopPin             #
######################################################

######################################################
#  JtagCell:  leafCellName                           #
#  JtagInst:  <instName | HInstName>                 #
######################################################

#########################################################
#  PhysicalNet: <name> [-pwr|-gnd|-tiehi|-tielo]        #
#########################################################
PhysicalNet: vdd -pwr
PhysicalNet: gnd -gnd

#########################################################
#  PhysicalInstance: <name> <cell> <orient> <llx> <lly> #
#########################################################

#####################################################################
#  Group: <group_name> <nrHinst> [-isPhyHier]                       #
#    <inst_name>                                                    #
#    ...                                                            #
#####################################################################

#####################################################################
#  Fence:  <name> <llx> <lly> <urx> <ury> <nrConstraintBox>         #
#    ConstraintBox: <llx> <lly> <urx> <ury>                         #
#    ...                                                            #
#  Region: <name> <llx> <lly> <urx> <ury> <nrConstraintBox>         #
#    ConstraintBox: <llx> <lly> <urx> <ury>                         #
#    ...                                                            #
#  Guide:  <name> <llx> <lly> <urx> <ury> <nrConstraintBox>         #
#    ConstraintBox: <llx> <lly> <urx> <ury>                         #
#    ...                                                            #
#  SoftGuide: <name>                                                #
#    ...                                                            #
#####################################################################

###########################################################################
#  <Constraints>                                                          #
#     <Constraint  type="fence|guide|region|softguide"                    #
#                  readonly=1  name="blk_name">                           #
#       <Box llx=1 lly=2 urx=3 ury=4 /> ...                               #
#     </Constraint>                                                       #
#  </Constraints>                                                         #
###########################################################################
######################################################################################
#  BlackBox: -cell <cell_name> { -size <x> <y> |  -area <um^2> | \                  #
#            -gatecount <count> <areapergate> <utilization> | \                     #
#            {-gateArea <gateAreaValue> [-macroArea <macroAreaValue>]} } \          #
#            [-minwidth <w> | -minheight <h> | -fixedwidh <w> | -fixedheight <h>] \ #
#            [-aspectratio <ratio>]                                                  #
#            [-boxList <nrConstraintBox>                                             #
#              ConstraintBox: <llx> <lly> <urx> <ury>                                #
#              ... ]                                                                 #
######################################################################################

#######################################################################################
#  <Blackboxes>                                                                       #
#     <Blackbox  cell=name  width=N height=N                                          #
#                { area=A | gatecount=N areaPerGate=A cellUtil=F |                    #
#                  gateArea=F {macroArea=F | macorList='str'} includeMacroArea={0|1}} #
#                [minWidth=N | minHeight=N | fixedWidh=N | fixedHeight=N]             #
#                [aspectRatio=R] >                                                    #
#         <Box llx=float lly=float urx=float ury=float /> ...                         #
#     </Blackbox>                                                                     #
#  </Blackboxes>                                                                      #
#######################################################################################

######################################################
#  Instance: <name> <orient> <llx> <lly>             #
######################################################

#################################################################
#  Block: <name> <orient> [<llx> <lly>]                         #
#         [<haloLeftMargin>  <haloBottomMargin>                 #
#          <haloRightMargin> <haloTopMargin> <haloFromInstBox>] #
#         [<IsInstDefCovered> <IsInstPreplaced>]                #
#                                                               #
#  Block with INT_MAX loc is for recording the halo block with  #
#  non-prePlaced status                                         #
#################################################################

######################################################
#  BlockLayerObstruct: <name> <layerX> ...           #
######################################################

######################################################
#  FeedthroughBuffer: <instName>                     #
######################################################

###########################################################################
#  <HierarchicalPartitions>                                               #
#     <GlobalPinConstraints>                                              #
#         <PinSpacing spacing=val />                                      #
#         <PinWidth layer=layerId width=val />                            #
#         <PinDepth layer=layerId depth=val />                            #
#         <CornerToPinDistance distance=val />                            #
#     </GlobalPinConstraints>                                             #
#     <CellPtnCut name="name" cuts=Num >                                  #
#        <Box llx=11.0 lly=22.0 urx=33.0 ury=44.0 /> ...                  #
#     </CellPtnCut>                                                       #
#     <NetGroup name="group_name" nets=val spacing=val isOptOrder=val   #
#         isAltLayer=val isPffGroup=val isSpreadPin=val                   #
#         isExcludeAllLayer=val isExcludeSameLayer=val keepOutDistance=val#
#         isPureExclude=val isCompactArea=val isMixedSignal=val >         #
#         <Net name="net_name" /> ...                                   #
#     </NetGroup>                                                         #
#     <Partition name="ptn_name"  hinst="name"                            #
#         coreToLeft=fval coreToRight=fval coreToTop=fval                 #
#         coreToBottom=val pinSpacingNorth=val pinSpacingWest=val         #
#         pinSpacingSouth=val pinSpacingEast=val  blockedLayers=xval >    #
#         <TrackHalfPitch Horizontal=val Vertical=val />                  #
#         <SpacingHalo left=10.0 right=11.0 top=11.0 bottom=11.0 />       #
#         <Clone hinst="hinst_name" orient=R0|R90|... />                  #
#         <PinLayer side="N|W|S|E" Metal1=yes Metal2=yes ... />           #
#         <RowSize cellHeight=1.0 railWidth=1.0 />                        #
#         <DefaultTechSite name="core" />                                   #
#         <RoutingHalo sideSize=11.0 bottomLayer=M1 topLayer=M2  />       #
#         <SpacingHalo left=11.0 right=11.0 top=11.0 bottom=11.0 />       #
#         <PinToCornerDistance  totalCorners=nrCorners >                  #
#            <Corner number=<cornerNumber> distance=<distance> /> ...     #
#         </PinToCornerDistance >                                         #
#         <PinSpacingArea llx=val lly=val urx=val ury=val spacing=val />  #
#         <LayerWidthDepth layer=layerId width=w depth=d />               #
#         <PinConstraint>                                                 #
#            <Pin name="pinName" >                                      #
#               <edge2 edgeMap=val />                                    #
#               <spacing space=val />                                    #
#               <layer layerMap=xval />                                  #
#               <pinWidth width=val />                                   #
#               <pinDepth depth=val />                                   #
#               <location x=val y=val />                                 #
#            </Pin>                                                       #
#         </PinConstraint>                                                #
#     </Partition>                                                        #
#     <CellPinGroup name="group_name" cell="cell_name" pins=nr        #
#         spacing=val isOptOrder=val isAltLayer=val isSpreadPin=val       #
#         isExcludeAllLayer=val isExcludeSameLayer=val keepOutDistance=val#
#         isPureExclude=val isCompactArea=val >                           #
#         <GroupFTerm name="term_name" /> ...                             #
#     </CellPinGroup>                                                     #
#     <PartitionPinBlockage layerMap=x llx=1 lly=2 urx=3 ury=4 name="n" />#
#     <PinGuide name="name" boxes=num layerPriority=val cell="name" >     #
#        <Box llx=11.0 lly=22.0 urx=33.0 ury=44.0 layer=id /> ...         #
#     </PinGuide>                                                         #
#  </HierarchicalPartitions>                                              #
###########################################################################
<HierarchicalPartitions>
    <GlobalPinConstraints>
        <PinSpacing spacing=2 />
        <CornerToPinDistance distance=5 />
    </GlobalPinConstraints>
    <Partition name="layout_lab_design" hinst="" coreToLeft=0.0000 coreToRight=0.0000 coreToTop=0.0000 coreToBottom=0.0000 pinSpacingNorth=-1 pinSpacingWest=-1 pinSpacingSouth=-1 pinSpacingEast=-1 blockedLayers=0x7 orient=R0>
	<PinLayer side="N" Metal2=yes />
	<PinLayer side="W" Metal3=yes />
	<PinLayer side="S" Metal2=yes />
	<PinLayer side="E" Metal3=yes />
    <PinToCornerDistance totalCorners=4 >
      <Corner number=0 distance=-1 />
      <Corner number=1 distance=-1 />
      <Corner number=2 distance=-1 />
      <Corner number=3 distance=-1 />
    </PinToCornerDistance>
    </Partition>
</HierarchicalPartitions>

####################################################################################
#  <PlacementBlockages>                                                            #
#     <Blockage name="blk_name" type="hard|soft|partial">                      #
#       <Attr density=1.2 excludeFlops=yes inst="inst_name" pushdown=yes />      #
#       <Box llx=1 lly=2 urx=3 ury=4 /> ...                                        #
#     </Blockage>                                                                  #
#  </PlacementBlockages>                                                           #
####################################################################################

#################################################################
#  <SizeBlockages>                                             #
#     <Blockage name="blk_name">                              #
#       <Box llx=1 lly=2 urx=3 ury=4 /> ...                     #
#     </Blockage>                                               #
#  </SizeBlockages>                                            #
#################################################################

##########################################################################################################
#  <RouteBlockages>                                                                                      #
#     <Blockage name="blk_name" type="User|RouteGuide|PtnCut|WideWire">                              #
#       <Attr spacing=1.2 drw=1.2 inst="name" pushdown=yes fills=yes exceptpgnet=yes pgnetonly=yes />  #
#       <Layer type="route|cut|masterslice" id=layerNo />                                              #
#       <Box llx=1 lly=2 urx=3 ury=4 /> ...                                                              #
#       <Poly points=nr x0=1 y0=1 x1=2 y2=2 ...  />                                                      #
#     </Blockage>                                                                                        #
#  </RouteBlockages>                                                                                     #
##########################################################################################################

######################################################
#  NetWeight: <net_name> <weight (in integer)>       #
######################################################

###########################################################################################
# NetbottomPreferredRoutingLayer:  <net_name> <bottomPreferredRoutingLayer (in integer)>  #
###########################################################################################

################################################################
# NetAvoidDetour:  <net_name>  < avoidDetour  { 1| 0}>   #
################################################################

#################################################################
#  SprFile: <file_name>                                         #
#################################################################
SprFile: .layout_lab_design33267.rs.fp.spr

#######################################################################################
#  IO: <instName> <cellName> <lx> <ly> <side> <orient> {-power|-ground|-} \           #
#      [isCovered isPrePlaced]                                                        #
#  IOPin: <pinName> <x> <y> <side> <layerId> <width> <depth> {placed|fixed|cover|-} <nrBox> #
#    PinBox: <llx> <lly> <urx> <ury>                                                  #
#    PinPoly: <nrPt> <x1> <y1> <x2> <y2> ...<xn> <yn>                                 #
#######################################################################################
IO: c00 PADFC 1200.0000 1200.0000 NE R270 - 01
IO: U6 PADINC 1110.0000 1200.0000 N R0 - 01
IO: FN5 PADNC 1020.0000 1200.0000 N R0 - 01
IO: FN4 PADNC 930.0000 1200.0000 N R0 - 01
IO: FN3 PADNC 840.0000 1200.0000 N R0 - 01
IO: G0 PADGND 750.0000 1200.0000 N R0 - 01
IO: P0 PADVDD 660.0000 1200.0000 N R0 - 01
IO: FN2 PADNC 570.0000 1200.0000 N R0 - 01
IO: FN1 PADNC 480.0000 1200.0000 N R0 - 01
IO: FN0 PADNC 390.0000 1200.0000 N R0 - 01
IO: U5 PADINC 300.0000 1200.0000 N R0 - 01
IO: c01 PADFC 0.0000 1200.0000 NW R0 - 01
IO: FW6 PADNC 0.0000 1110.0000 W R90 - 01
IO: FW5 PADNC 0.0000 1020.0000 W R90 - 01
IO: U2 PADOUT 0.0000 930.0000 W R90 - 01
IO: FW4 PADNC 0.0000 840.0000 W R90 - 01
IO: G1 PADGND 0.0000 750.0000 W R90 - 01
IO: P1 PADVDD 0.0000 660.0000 W R90 - 01
IO: FW3 PADNC 0.0000 570.0000 W R90 - 01
IO: U1 PADOUT 0.0000 480.0000 W R90 - 01
IO: FW2 PADNC 0.0000 390.0000 W R90 - 01
IO: FW1 PADNC 0.0000 300.0000 W R90 - 01
IO: c02 PADFC 0.0000 0.0000 SW R90 - 01
IO: U15 PADINC 1110.0000 0.0000 S R180 - 01
IO: U14 PADINC 1020.0000 0.0000 S R180 - 01
IO: U13 PADINC 930.0000 0.0000 S R180 - 01
IO: U12 PADINC 840.0000 0.0000 S R180 - 01
IO: G2 PADGND 750.0000 0.0000 S R180 - 01
IO: P2 PADVDD 660.0000 0.0000 S R180 - 01
IO: U11 PADINC 570.0000 0.0000 S R180 - 01
IO: U10 PADINC 480.0000 0.0000 S R180 - 01
IO: U9 PADINC 390.0000 0.0000 S R180 - 01
IO: U8 PADINC 300.0000 0.0000 S R180 - 01
IO: c03 PADFC 1200.0000 0.0000 SE R180 - 01
IO: FE4 PADNC 1200.0000 1110.0000 E R270 - 01
IO: U16 PADINC 1200.0000 1020.0000 E R270 - 01
IO: U7 PADINC 1200.0000 930.0000 E R270 - 01
IO: FE3 PADNC 1200.0000 840.0000 E R270 - 01
IO: G3 PADGND 1200.0000 750.0000 E R270 - 01
IO: P3 PADVDD 1200.0000 660.0000 E R270 - 01
IO: FE2 PADNC 1200.0000 570.0000 E R270 - 01
IO: U4 PADOUT 1200.0000 480.0000 E R270 - 01
IO: U3 PADOUT 1200.0000 390.0000 E R270 - 01
IO: FE1 PADNC 1200.0000 300.0000 E R270 - 01

##############################################################################
#  <IOPins>                                                                  #
#    <Pin name="pin_name" type="clock|power|ground|analog"                   #
#         status="covered|fixed|placed" is_special=1 >                       #
#      <Port>                                                                #
#        <Pref x=1 y=2 side="N|S|W|E|U|D" width=w depth=d orientation=val /> #
#        <Via name="via_name" x=1 y=2 BotMask=2 CutMask=1 TopMask=2 />...  #
#        <Layer id=id spacing=1.2 drw=1.2>                                   #
#          <Box llx=1 lly=2 urx=3 ury=4 /> ...                               #
#          <Poly points=nr x0=1 y0=1 x1=2 y2=2 ...           />              #
#        </Layer> ...                                                        #
#      </Port>  ...                                                          #
#      <NETEXPR>                                                             #
#        ground VSS                                                          #
#      </NETEXPR> ...                                                        #
#      <Antenna model=num type="name" value=float_num layer=num /> ...       #
#    </Pin> ...                                                              #
#  </IOPins>                                                                 #
##############################################################################

<IOPins>
  <Pin name="clk" status="fixed" >
  </Pin>
  <Pin name="n_rst" status="fixed" >
  </Pin>
  <Pin name="d_plus" status="fixed" >
  </Pin>
  <Pin name="d_minus" status="fixed" >
  </Pin>
  <Pin name="transmit" status="fixed" >
  </Pin>
  <Pin name="write_enable" status="fixed" >
  </Pin>
  <Pin name="write_data[7]" status="fixed" >
  </Pin>
  <Pin name="write_data[6]" status="fixed" >
  </Pin>
  <Pin name="write_data[5]" status="fixed" >
  </Pin>
  <Pin name="write_data[4]" status="fixed" >
  </Pin>
  <Pin name="write_data[3]" status="fixed" >
  </Pin>
  <Pin name="write_data[2]" status="fixed" >
  </Pin>
  <Pin name="write_data[1]" status="fixed" >
  </Pin>
  <Pin name="write_data[0]" status="fixed" >
  </Pin>
  <Pin name="fifo_empty" status="fixed" >
  </Pin>
  <Pin name="fifo_full" status="fixed" >
  </Pin>
</IOPins>

#####################################################################
#  <Property>                                                       #
#     <obj_type name="inst_name" >                                  #
#       <prop name="name" type=type_name value=val />               #
#       <Attr name="name" type=type_name value=val />               #
#     </obj_type>                                                   #
#  </Property>                                                      #
#  where:                                                           #
#       type is data type: Box, String, Int, PTR, Loc, double, Bits #
#       obj_type are: inst, Design, instTerm, Bump, cell, net       #
#####################################################################
<Properties>
  <Design name="layout_lab_design">
  </Design>
</Properties>

################################################################################
#  NetProperties: <net_name> [-special] [-def_prop {int|dbl|str} <value>]...   #
################################################################################

##################################################################################
#    Feedthru info:                                                              #
# <Feedthrus>                                                                    #
#   <Feedthru>                                                                   #
#       <tsv llx=n lly=n urx=n ury=n />                                          #
#       <stackvia layer=z llx=n lly=n urx=n ury=n />                             #
#       <bump front=name back=name  />                                           #
#   </Feedthru>                                                                  #
#   <Feedthru>                                                                   #
#   <...>                                                                        #
#   </Feedthru>                                                                  #
# </Feedthrus>                                                                   #
################################################################################
