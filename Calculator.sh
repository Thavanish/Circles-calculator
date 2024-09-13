#!/bin/bash

# Function to calculate the sector area
sector_area() {
    local radius=$1
    local angle=$2
    echo "scale=4; ($angle / 360) * 3.14159 * $radius * $radius" | bc
}

# Function to calculate the minor segment area
minor_segment_area() {
    local radius=$1
    local angle=$2
    local sector=$(sector_area $radius $angle)
    local radian_angle=$(echo "scale=4; $angle * 3.14159 / 180" | bc)
    local triangle_area=$(echo "scale=4; 0.5 * $radius * $radius * s($radian_angle)" | bc -l)
    echo "scale=4; $sector - $triangle_area" | bc
}

# Function to calculate the major segment area
major_segment_area() {
    local radius=$1
    local angle=$2
    local minor_segment=$(minor_segment_area $radius $angle)
    local major_segment=$(echo "scale=4; 3.14159 * $radius * $radius - $minor_segment" | bc)
    echo $major_segment
}

# Function to calculate the major sector area
major_sector_area() {
    local radius=$1
    local angle=$2
    local minor_sector=$(sector_area $radius $angle)
    local major_sector=$(echo "scale=4; 3.14159 * $radius * $radius - $minor_sector" | bc)
    echo $major_sector
}

# Function to calculate the minor sector area
minor_sector_area() {
    local radius=$1
    local angle=$2
    local sector=$(sector_area $radius $angle)
    echo $sector
}

# Function to display formulas
show_formulas() {
    dialog --msgbox "Formulas:\n\n\
Sector Area = (angle / 360) * π * radius²\n\
Major Sector Area = π * radius² - Minor Sector Area\n\
Minor Segment Area = Sector Area - Triangle Area\n\
Major Segment Area = π * radius² - Minor Segment Area\n\
Triangle Area = 0.5 * radius² * sin(radian_angle)" 20 60
}

# Main function
calculate() {
    local radius=$1
    local angle=$2
    local choice=$3

    local sector=$(sector_area $radius $angle)
    local major_sector=$(major_sector_area $radius $angle)
    local minor_segment=$(minor_segment_area $radius $angle)
    local major_segment=$(major_segment_area $radius $angle)
    local minor_sector=$(minor_sector_area $radius $angle)

    # Prepare the detailed calculation information
    local sector_formula="Sector Area = ($angle / 360) * π * $radius²"
    local major_sector_formula="Major Sector Area = π * $radius² - Minor Sector Area"
    local minor_segment_formula="Minor Segment Area = Sector Area - Triangle Area"
    local major_segment_formula="Major Segment Area = π * $radius² - Minor Segment Area"
    local triangle_formula="Triangle Area = 0.5 * $radius² * sin(radian_angle)"
    local radian_angle=$(echo "scale=4; $angle * 3.14159 / 180" | bc)
    local triangle_area=$(echo "scale=4; 0.5 * $radius * $radius * s($radian_angle)" | bc -l)

    case $choice in
        1)
            result="Sector Area: $sector\n\n$sector_formula"
            ;;
        2)
            result="Major Sector Area: $major_sector\n\n$major_sector_formula"
            ;;
        3)
            result="Minor Segment Area: $minor_segment\n\n$minor_segment_formula\nTriangle Area: $triangle_area"
            ;;
        4)
            result="Major Segment Area: $major_segment\n\n$major_segment_formula"
            ;;
        5)
            result="Minor Sector Area: $minor_sector\n\n$sector_formula"
            ;;
        *)
            dialog --msgbox "Invalid choice." 5 30
            exit 1
            ;;
    esac

    dialog --msgbox "$result" 20 60
}

# Input radius
radius=$(dialog --inputbox "Enter the radius:" 8 40 3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
    echo "Cancelled or error occurred."
    exit 1
fi

# Input angle
angle=$(dialog --inputbox "Enter the angle in degrees:" 8 40 3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
    echo "Cancelled or error occurred."
    exit 1
fi

# Choose what to calculate
choice=$(dialog --menu "Choose what to calculate:" 15 50 6 \
    1 "Sector Area" \
    2 "Major Sector Area" \
    3 "Minor Segment Area" \
    4 "Major Segment Area" \
    5 "Minor Sector Area" \
    6 "Formulas" \
    3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
    echo "Cancelled or error occurred."
    exit 1
fi

if [ "$choice" -eq 6 ]; then
    show_formulas
    exit 0
fi

# Input validation
if [[ -z "$radius" || -z "$angle" ]]; then
    dialog --msgbox "Both radius and angle must be provided." 5 30
    exit 1
fi

if ! [[ $radius =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ $angle =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    dialog --msgbox "Both radius and angle must be positive numbers." 5 30
    exit 1
fi

calculate $radius $angle $choice



echo "by TopG"
