# TCL File Generated by Component Editor 16.1
# Wed Feb 15 15:33:00 CET 2017
# DO NOT MODIFY


# 
# fir_st "fir filter" v1.0
#  2017.02.15.15:33:00
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module fir_st
# 
set_module_property DESCRIPTION ""
set_module_property NAME fir_st
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME "fir filter"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL fir_st
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file fir_st.vhd VHDL PATH fir/fir_st.vhd TOP_LEVEL_FILE

add_fileset SIM_VHDL SIM_VHDL "" ""
set_fileset_property SIM_VHDL TOP_LEVEL fir_st
set_fileset_property SIM_VHDL ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VHDL ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file fir_st.vhd VHDL PATH fir/fir_st.vhd
add_fileset_file fir_st_tb.vhd VHDL PATH fir/fir_st_tb.vhd


# 
# parameters
# 
add_parameter filterOrder INTEGER 10
set_parameter_property filterOrder DEFAULT_VALUE 10
set_parameter_property filterOrder DISPLAY_NAME filterOrder
set_parameter_property filterOrder TYPE INTEGER
set_parameter_property filterOrder UNITS None
set_parameter_property filterOrder HDL_PARAMETER true
add_parameter inputWidth INTEGER 24
set_parameter_property inputWidth DEFAULT_VALUE 24
set_parameter_property inputWidth DISPLAY_NAME inputWidth
set_parameter_property inputWidth TYPE INTEGER
set_parameter_property inputWidth UNITS None
set_parameter_property inputWidth HDL_PARAMETER true
add_parameter coefWidth INTEGER 8
set_parameter_property coefWidth DEFAULT_VALUE 8
set_parameter_property coefWidth DISPLAY_NAME coefWidth
set_parameter_property coefWidth TYPE INTEGER
set_parameter_property coefWidth UNITS None
set_parameter_property coefWidth HDL_PARAMETER true
add_parameter coefShift INTEGER 8
set_parameter_property coefShift DEFAULT_VALUE 8
set_parameter_property coefShift DISPLAY_NAME coefShift
set_parameter_property coefShift TYPE INTEGER
set_parameter_property coefShift UNITS None
set_parameter_property coefShift HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset_n reset_n Input 1


# 
# connection point avalon_streaming_sink
# 
add_interface avalon_streaming_sink avalon_streaming end
set_interface_property avalon_streaming_sink associatedClock clock
set_interface_property avalon_streaming_sink associatedReset reset
set_interface_property avalon_streaming_sink dataBitsPerSymbol 8
set_interface_property avalon_streaming_sink errorDescriptor ""
set_interface_property avalon_streaming_sink firstSymbolInHighOrderBits true
set_interface_property avalon_streaming_sink maxChannel 0
set_interface_property avalon_streaming_sink readyLatency 0
set_interface_property avalon_streaming_sink ENABLED true
set_interface_property avalon_streaming_sink EXPORT_OF ""
set_interface_property avalon_streaming_sink PORT_NAME_MAP ""
set_interface_property avalon_streaming_sink CMSIS_SVD_VARIABLES ""
set_interface_property avalon_streaming_sink SVD_ADDRESS_GROUP ""

add_interface_port avalon_streaming_sink ast_sink_data data Input inputwidth
add_interface_port avalon_streaming_sink ast_sink_ready ready Output 1
add_interface_port avalon_streaming_sink ast_sink_valid valid Input 1
add_interface_port avalon_streaming_sink ast_sink_error error Input 2


# 
# connection point avalon_streaming_source
# 
add_interface avalon_streaming_source avalon_streaming start
set_interface_property avalon_streaming_source associatedClock clock
set_interface_property avalon_streaming_source associatedReset reset
set_interface_property avalon_streaming_source dataBitsPerSymbol 8
set_interface_property avalon_streaming_source errorDescriptor ""
set_interface_property avalon_streaming_source firstSymbolInHighOrderBits true
set_interface_property avalon_streaming_source maxChannel 0
set_interface_property avalon_streaming_source readyLatency 0
set_interface_property avalon_streaming_source ENABLED true
set_interface_property avalon_streaming_source EXPORT_OF ""
set_interface_property avalon_streaming_source PORT_NAME_MAP ""
set_interface_property avalon_streaming_source CMSIS_SVD_VARIABLES ""
set_interface_property avalon_streaming_source SVD_ADDRESS_GROUP ""

add_interface_port avalon_streaming_source ast_source_data data Output inputwidth
add_interface_port avalon_streaming_source ast_source_ready ready Input 1
add_interface_port avalon_streaming_source ast_source_valid valid Output 1
add_interface_port avalon_streaming_source ast_source_error error Output 2

