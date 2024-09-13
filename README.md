# Circle Calculator with Dialog

A Bash script for calculating various circle-related values such as sector area, major segment, minor segment, and more. This script uses `dialog` to provide a simple text-based GUI for user interaction.

## Features

- **Sector Area:** Calculate the area of a sector given the radius and angle.
- **Major Sector Area:** Calculate the area of the major sector.
- **Minor Segment Area:** Calculate the area of the minor segment.
- **Major Segment Area:** Calculate the area of the major segment.
- **Minor Sector Area:** Calculate the area of the minor sector.
- **Formulas Tab:** View the formulas used in the calculations.

## Prerequisites

- A Unix-like operating system (Linux, macOS, etc.)
- `dialog` installed on your system. You can install it using:
  - For Debian-based systems: `sudo apt-get install dialog`
  - For Red Hat-based systems: `sudo yum install dialog`
  - For macOS: `brew install dialog`

## Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/yourusername/circle-calculator-dialog.git
    ```

2. **Navigate to the directory:**

    ```bash
    cd circle-calculator-dialog
    ```

3. **Make the script executable:**

    ```bash
    chmod +x circle_calculator_dialog.sh
    ```

## Usage

1. Run the script:

    ```bash
    ./circle_calculator_dialog.sh
    ```

2. Follow the prompts to enter the radius and angle, choose the calculation type, or view formulas.

## Example

1. Run the script:

    ```bash
    ./circle_calculator_dialog.sh
    ```

2. Enter the radius and angle when prompted.
3. Choose what to calculate from the menu or view the formulas.

## Script Details

The script provides the following calculations:

- **Sector Area:** Area of the sector based on the radius and angle.
- **Major Sector Area:** Area of the sector not covered by the minor sector.
- **Minor Segment Area:** Area of the minor segment.
- **Major Segment Area:** Area of the major segment.
- **Minor Sector Area:** Area of the minor sector.
- **Formulas Tab:** Displays the formulas used for the calculations.

## Contributing

If you'd like to contribute to this project, please fork the repository and submit a pull request with your changes. Contributions are welcome!

## License

This script is provided as-is. You are free to use, modify, and distribute it according to your need
