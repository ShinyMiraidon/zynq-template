set target [lindex $argv 0]
set design_file [lindex $argv 2]
set devtree $zynq_root/device-tree-xlnx

# Generate the device tree and boot loader through SDK
if { [string compare $target "zc706"] == 0 } {
    puts "Target Board is zc706"
} elseif { [string compare $target "zc702"] == 0 } {
    puts "Target Board is zc702"
} elseif { [string compare $target "zcu102"] == 0 } {
    puts "Target Board is zcu102"
} elseif { [string compare $target "zcu106"] == 0 } {
    puts "Target Board is zcu106"
} else {
    puts "Board part number is invalid!"
    exit
}

hsi open_hw_design $design_file.hdf
set design [hsi current_hw_design]
if {[llength $design] != 1} {
    error "Expected one current hardware design after opening $design_file.hdf, found [llength $design]"
}
puts "INFO: using HSI hardware design $design from $design_file.hdf"
hsi set_repo_path $devtree
