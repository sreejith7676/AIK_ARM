#!/bin/bash

# Define paths based on the current directory
BASE_DIR=$(pwd)
SPLIT_FOLDER="$BASE_DIR/split"
ANYKERNEL_FOLDER="$BASE_DIR/AnyKernel3"

# Check if kernel file exists in split folder
if [ -f "$SPLIT_FOLDER/kernel" ]; then
    # Copy kernel to AnyKernel3 folder
    cp "$SPLIT_FOLDER/kernel" "$ANYKERNEL_FOLDER/"

    # Change to AnyKernel3 folder
    cd "$ANYKERNEL_FOLDER" || exit

    # Zip the contents while excluding unnecessary files
    zip -r9 UPDATE-AnyKernel3.zip * -x .git README.md *placeholder*

    echo "UPDATE-AnyKernel3.zip created successfully in $ANYKERNEL_FOLDER"
else
    echo "Kernel file not found in $SPLIT_FOLDER"
fi

